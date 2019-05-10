#
#  # The following commented code was supposed to create a subkey .None under
#  # HKCU\AppEvents\Schemes\Names\.None
#  # Howeever, the .None subkey seems to be existent anyway.
#  # So it's commented now.
#
#  if (-not (test-path 'HKCU:\AppEvents\Schemes\Names\.None')) { 
#      new-item         -path 'HKCU:\AppEvents\Schemes\Names' -Name '.None'
#      new-itemProperty -path 'HKCU:\AppEvents\Schemes\Names\.None' -Name '(Default)' -Type 'String' -Value 'No Sounds'
#  }
#

$defaultSounds = get-childItem hkcu:\AppEvents\Schemes\Apps\.Default -recurse | get-itemProperty

forEach ($regkey in $defaultSounds) {
    $strVal = [string]$regkey.'(default)'
    if ($strVal.endsWith('.wav')) {

    echo $regKey.psPath $strVal
#
#       TODO: the followign set-itemProperty should probably only be executed
#       if the path ends in .Current
#
#       set-itemProperty -path $regkey.psPath -name '(default)' -Value ''
#
    }
}

#
#  Compare with the following one liner
#     Get-ChildItem -Path "HKCU:\AppEvents\Schemes\Apps" | Get-ChildItem | Get-ChildItem | Where-Object {$_.PSChildName -eq ".Current"} | Set-ItemProperty -Name "(Default)" -Value ""
#  which was found at
#     https://superuser.com/a/1397681/16610
#
