set-strictMode -version latest

# $regKey = 'HKCU:\Console\%SystemRoot%_system32_cmd.exe'
  $regKey = 'HKCU:\Console\%SystemRoot%_System32_WindowsPowerShell_v1.0_powershell.exe'

$fontName     = 'Consolas'
$width        =    0   # Does not seem to play a role for Lucida Console
$height       =   12

$fontSize     =  0x10000 * $height + $width

$null = new-itemProperty -path $regKey -name FontSize   -value  $fontSize   -force
$null = new-itemProperty -path $regKey -name FaceName   -value  $fontName   -force
$null = new-itemProperty -path $regKey -name FontWeight -value   400        -force
