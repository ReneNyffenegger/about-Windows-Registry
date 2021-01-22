$funcDef = @'

    [DllImport("user32.dll", SetLastError = true, CharSet=CharSet.Auto)]

     public static extern IntPtr SendMessageTimeout (
        IntPtr     hWnd,
        uint       msg,
        UIntPtr    wParam,
        string     lParam,
        uint       fuFlags,
        uint       uTimeout,
    out UIntPtr    lpdwResult
     );

'@

$funcRef = add-type -namespace WinAPI -name functions -memberDefinition $funcDef

$HWND_BROADCAST   = [intPtr] 0xFFFF
$WM_SETTINGCHANGE =          0x001A  # Same as WM_WININICHANGE
$fuFlags          =               2  # SMTO_ABORTIFHUNG: return if receiving thread does not respond (hangs)
$timeOutMs        =            1000  # Timeout in milli seconds
$res              = [uIntPtr]::zero

# If the function succeeds, this value is non-zero.
$funcVal = [WinAPI.functions]::SendMessageTimeout($HWND_BROADCAST, $WM_SETTINGCHANGE, [UIntPtr]::zero, "Environment", $fuFlags, $timeOutMs, [ref] $res);

if ($funcVal -eq 0) {
   write-host "SendMessageTimeout did not succeed, res= $res"
}
else {
   write-host "Message sent"
}
