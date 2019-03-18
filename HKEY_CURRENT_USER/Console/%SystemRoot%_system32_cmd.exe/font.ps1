set-strictMode -version 2

$width        =    0   # Does not seem to play a role for Lucida Console
$height       =    9

$fontSize     =  0x10000 * $height + $width

$eatOutput = new-itemProperty -path "HKCU:\Console\%SystemRoot%_system32_cmd.exe" -name FontSize   -value  $fontSize       -force
$eatOutput = new-itemProperty -path "HKCU:\Console\%SystemRoot%_system32_cmd.exe" -name FaceName   -value "Lucida Console" -force
$eatOutput = new-itemProperty -path "HKCU:\Console\%SystemRoot%_system32_cmd.exe" -name FontWeight -value  400             -force
