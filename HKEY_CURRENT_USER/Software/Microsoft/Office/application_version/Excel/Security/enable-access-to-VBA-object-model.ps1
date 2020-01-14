#
# Following value is something like 'Application.Excel.16'
#
$officeVersion = (get-item hklm:\Software\Classes\excel.application\curVer).getValue('')

#
# Remove 'Application.Excel.' from / add '.0' to version string, resulting in something like '16.0'
#
$officeVersion = $officeVersion -replace '.*\.(\d+)', '$1.0'

new-itemProperty -path HKCU:\Software\Microsoft\Office\$officeVersion\Excel\Security -name 'AccessVBOM' -value 1 -force | out-null
