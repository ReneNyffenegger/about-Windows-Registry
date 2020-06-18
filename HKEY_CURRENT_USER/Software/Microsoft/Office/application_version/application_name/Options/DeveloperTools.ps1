set-strictMode -version latest

if ($args.length -ne 1) {
   write-host ".\DeveloperTools.ps1 [Word|Excel|...]"
   return
}

$application_name = $args[0]

if ($application_name -notIn 'Access', 'Excel', 'PowerPoint', 'Word') {
   write-host 'First parameter must be one of Access, Excel, PowerPoint or Word'
   return
}

$regKey = "hklm:\Software\Classes\${application_name}.application\curVer"

if (! (test-path $regKey)) {
   write-host "Registry key $regKey was not found"
   return
}

$application_version = (get-item $regKey).getValue('')  -replace '.*\.(\d+)', '$1'

set-itemProperty  `
  "hkcu:\Software\Microsoft\Office\$application_version.0\$application_name\Options" `
  -type   DWord           `
  -name  'DeveloperTools' `
  -value  1               `
  -force
