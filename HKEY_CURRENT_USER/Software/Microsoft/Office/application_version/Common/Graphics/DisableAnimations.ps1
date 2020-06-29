$officeVersion = (get-item hklm:\Software\Classes\excel.application\curVer).getValue('')  -replace '.*\.(\d+)', '$1'

$regKey = "hkcu:\Software\Microsoft\Office\$officeVersion.0\Common\Graphics"

if (! (test-path $regKey ) ){
  write-host "creating $regKey"
  $null = new-item $regKey
}

$null = new-itemProperty $regKey -name DisableAnimations  -value 1 -force
