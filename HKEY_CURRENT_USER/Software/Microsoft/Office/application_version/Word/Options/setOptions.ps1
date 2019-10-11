$officeVersion = (get-item hklm:\Software\Classes\excel.application\curVer).getValue('')  -replace '.*\.(\d+)', '$1.0'

new-itemProperty                                                       `
   -path "HKCU:\Software\Microsoft\Office\$officeVersion\Word\Options" `
   -name         SQLSecurityCheck                                      `
   -value        0                                                     `
   -propertyType dWord                                                 `
   -force                                                           |  `
    out-null


new-itemProperty                                                       `
   -path "HKCU:\Software\Microsoft\Office\$officeVersion\Word\Options" `
   -name         DeveloperTools                                        `
   -value        1                                                     `
   -propertyType dWord                                                 `
   -force                                                           |  `
    out-null
