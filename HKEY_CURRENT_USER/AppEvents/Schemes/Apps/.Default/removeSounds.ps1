#
#  # The following commented code was supposed to create a subkey .None under
#  # HKCU\AppEvents\Schemes\Names\.None
#  # However, the .None subkey seems to be existent anyway.
#  # So it's commented now.
#
#  if (-not (test-path 'HKCU:\AppEvents\Schemes\Names\.None')) {
#      new-item         -path 'HKCU:\AppEvents\Schemes\Names' -Name '.None'
#      new-itemProperty -path 'HKCU:\AppEvents\Schemes\Names\.None' -Name '(Default)' -Type 'String' -Value 'No Sounds'
#  }
#

$defaultSounds = get-childItem hkcu:\AppEvents\Schemes\Apps\.Default -recurse | get-itemProperty

forEach ($regkey in $defaultSounds) {

    if ( $regKey.psChildName -eq '.Current') {

       $strVal = [string]$regkey.'(default)'
       if ($strVal.endsWith('.wav') ) {

       #  echo "$regKey.psPath $strVal"
          set-itemProperty -path $regkey.psPath -name '(default)' -value ''
       }

    }
}
