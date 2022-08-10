set-strictMode -version latest

$null = new-psDrive -name HKCR -psProvider registry -root HKEY_CLASSES_ROOT

[Microsoft.Win32.RegistryKey] $regCLSIDs = get-item hkcr:/CLSID

foreach ($guid in $regCLSIDs.GetSubKeyNames()) {

   $regCLSID = $regCLSIDs.OpenSubKey($guid)
   $COMobj = $regCLSID.GetValue('')

   $COMobjLen = 50
   if ($COMobj -ne $null -and $COMobj.Length -gt $COMobjLen) {
      $COMobj = $COMobj.substring(0, $COMobjLen-3) + '...'
   }


   $progIdReg = $regCLSID.OpenSubKey('ProgID')

   if ($progIdReg) {
      $progId    = $progIdReg.GetValue('')

   }
   else {
      $progId = ''
   }

   $progIdLen = 50
   if ($COMobj -ne $null -and $COMobj.Length -gt $progIdLen) {
      $progId  = $progId.substring(0, $COMobjLen-3) + '...'
   }
  "{0,-$progIdLen}  {1}  {2,-$progIdLen}" -f $COMobj, $guid, $progId

}
