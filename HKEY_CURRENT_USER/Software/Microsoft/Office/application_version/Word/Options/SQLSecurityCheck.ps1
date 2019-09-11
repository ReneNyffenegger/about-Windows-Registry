$officeVersion = "16.0"

new-itemProperty                                                       `
   -path "HKCU:\Software\Microsoft\Office\$officeVersion\Word\Options" `
   -name "SQLSecurityCheck"                                            `
   -value 0                                                            `
   -propertyType dWord                                                 `
   -force                                                           |  `
    out-null
