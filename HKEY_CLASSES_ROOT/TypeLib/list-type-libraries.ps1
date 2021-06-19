set-strictMode -version latest

$null = new-psDrive -name HKCR -psProvider registry -root HKEY_CLASSES_ROOT

[Microsoft.Win32.RegistryKey] $regTypeLibs = get-item hkcr:/TypeLib

$last_guid = ''
foreach ($guid in $regTypeLibs.GetSubKeyNames()) {

   $regTypeLib = $regTypeLibs.OpenSubKey($guid)

   foreach ($version in $regTypeLib.GetSubKeyNames()) {

      $regVersion = $regTypeLib.OpenSubKey($version)
      $typeLibName = $regVersion.GetValue('')

      foreach ($versionKey in $regVersion.GetSubKeyNames()) {

         $regVersionKey = $regVersion.OpenSubKey($versionKey)

         if ($versionKey -match '^\d+$') { # typically a zero ('0', but other numbers are also seen)

            foreach ($winX in $regVersionKey.GetSubKeyNames()) {
               $regWinX = $regVersionKey.OpenSubKey($winX)
               $typeLibPath = $regWinX.GetValue('')

               if ($guid -eq $last_guid) {
                 $guid_ = ''
               }
               else {
                 $guid_ = $guid
               }

              '{0,38} {1,8} {2,-100} - {3,5} {4} ' -f $guid_, $version, $typeLibName, $winX, $typeLibPath

               $last_guid = $guid

            }
         }
      }
   }
}
