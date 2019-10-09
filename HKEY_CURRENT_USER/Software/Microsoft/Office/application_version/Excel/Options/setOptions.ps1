$officeVersion = (get-item hklm:\Software\Classes\excel.application\curVer).getValue('')  -replace '.*\.(\d+)', '$1'

$eatMe = new-itemProperty hkcu:\Software\Microsoft\Office\$officeVersion.0\Excel\Options -name DefaultCPG     -value 65001 -force
$eatMe = new-itemProperty hkcu:\Software\Microsoft\Office\$officeVersion.0\Excel\Options -name DefaultFormat  -value    34 -force # default default format is 33
$eatMe = new-itemProperty hkcu:\Software\Microsoft\Office\$officeVersion.0\Excel\Options -name DeveloperTools -value     1 -force
