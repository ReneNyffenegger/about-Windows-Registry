#
#  1)   Iterate over each .sys file under %SystemRoot%\System32\drivers and
#       check if a respective key is found under HKLM\SYSTEM\CurrentControlSet\Services
#

$driverFiles = get-childItem "$env:SystemRoot\System32\drivers"
foreach ($driverFile in $driverFiles) {
#
# The type of $driverFile is FileInfo. Thus, it has the valuable
# property extension
#
  if ($driverFile.extension -eq '.sys') {

     $driverFileName = $driverFile.name
     $driverFileWithoutExtension = [io.path]::getFileNameWithoutExtension($driverFileName)

     $regKeyName = "HKLM:\SYSTEM\CurrentControlSet\Services\" + $driverFileWithoutExtension

     if (! (test-path -path $regKeyName)) {
        "not found key for  $driverFileName"
     }
     else {
        "    found key for  $driverFileName"
     }

  }
  else {
     "Not a .sys file: " + $driverFile.name
  }
}

#
#  2)  Iterate over each key in HKLM\SYSTEM\CurrentControlSet\Services and
#      check if there is a respective .sys file under %SystemRoot%\System32\drivers
#
$regKeys = get-childItem "HKLM:\SYSTEM\CurrentControlSet\Services" -name
foreach ($regKeyName in $regKeys) {
   if (test-path -path ("$env:SystemRoot\System32\drivers\" + $regKeyName + ".sys") ) {
     "    found .sys file for key  " + $regKeyName
   }
   else {
     "not found .sys file for key  " + $regKeyName
   }
}
