[Microsoft.Win32.RegistryKey] $catids_regkey = get-item 'hklm:\software\classes\Component Categories'

foreach ($catid_name in $catids_regkey.GetSubKeyNames() ) {
   $catid_regkey = $catids_regkey.OpenSubKey($catid_name)
   $val_409      = $catid_regkey.GetValue('409')

  "$catid_name - $val_409"
}
