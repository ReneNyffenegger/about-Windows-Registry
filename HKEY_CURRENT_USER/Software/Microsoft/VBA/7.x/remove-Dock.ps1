$reg_key_VBA_7_x =  , @(get-item HKCU:\Software\Microsoft\VBA\7.*)

if ($reg_key_VBA_7_x.length -ne 1) {
   write-host "only one key matching 7.* was expected"
   return
}

remove-itemProperty "$($reg_key_VBA_7_x[0].psPath)\Common" Dock
