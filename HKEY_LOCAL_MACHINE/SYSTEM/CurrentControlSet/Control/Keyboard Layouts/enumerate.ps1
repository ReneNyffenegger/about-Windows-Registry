set-strictMode -version latest

$kbdLayouts = get-item 'hklm:\SYSTEM\CurrentControlSet\Control\Keyboard Layouts'

foreach ( $kbdLayoutId in $kbdLayouts.GetSubkeyNames() ) {

   $kbdLayout = $kbdLayouts.OpenSubKey($kbdLayoutId)

  "$kbdLayoutId`t$($kbdLayout.GetValue('Layout Text'))`t$($kbdLayout.GetValue('Layout File'))"

   $kbdLayout.Close()

}
