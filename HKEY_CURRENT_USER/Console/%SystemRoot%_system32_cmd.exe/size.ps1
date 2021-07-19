set-strictMode -version latest

# $regKey = 'HKCU:\Console\%SystemRoot%_system32_cmd.exe'
  $regKey = 'HKCU:\Console\%SystemRoot%_System32_WindowsPowerShell_v1.0_powershell.exe'

if (! (test-path $regKey) ) {
   $null = new-item $regKey
}

$width        =  180
$windowHeight =   75
$bufferHeight = 9999

$screenBufferSize =  0x10000 * $bufferHeight + $width
$windowSize       =  0x10000 * $windowHeight + $width

$null = new-itemProperty -path $regKey -name ScreenBufferSize -value $screenBufferSize -force
$null = new-itemProperty -path $regKey -name WindowSize       -value $windowSize       -force
