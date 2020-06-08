set-strictMode -version latest

if ($args.length -ne 2) {
   write-host "add-document [Word|Excel|...] P:\ath\to\document"
   return
}

$application_name = $args[0]
$document_name    = $args[1]

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
  "hkcu:\Software\Microsoft\Office\$application_version.0\$application_name\Security\Trusted Documents\TrustRecords" `
  -type binary         `
  -name $document_name `
  -force               `
  -value  0x06, 0x51, 0x45, 0x6f, 0x65, 0x3d, 0xd6, 0x01,
          0x00, 0xd0, 0x88, 0xc3, 0x10, 0x00, 0x00, 0x00,
          0xd2, 0xc5, 0x94, 0x01,
          0xff, 0xff, 0xff, 0x7f
