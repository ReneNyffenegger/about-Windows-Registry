set-strictMode -version latest

# $regKey = 'HKCU:\Console\%SystemRoot%_system32_cmd.exe'
  $regKey = 'HKCU:\Console\%SystemRoot%_System32_WindowsPowerShell_v1.0_powershell.exe'

[byte] $fg = [System.ConsoleColor]::White
[byte] $bg = [System.ConsoleColor]::Black

$color = 16*$bg + $fg

$null = new-itemProperty -path $regKey -name ScreenColors -value $color -force
