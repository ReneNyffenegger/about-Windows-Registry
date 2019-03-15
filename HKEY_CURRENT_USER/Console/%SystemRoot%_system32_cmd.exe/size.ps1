set-strictMode -version 2

$width        =  180
$windowHeight =   75
$bufferHeight = 9999

$screenBufferSize =  0x10000 * $bufferHeight + $width
$windowSize       =  0x10000 * $windowHeight + $width

$eatOutput = new-itemProperty -path "HKCU:\Console\%SystemRoot%_system32_cmd.exe" -name "ScreenBufferSize" -value $screenBufferSize -force
$eatOutput = new-itemProperty -path "HKCU:\Console\%SystemRoot%_system32_cmd.exe" -name "WindowSize"       -value $windowSize       -force
