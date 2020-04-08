$null = new-itemProperty -path 'hklm\SYSTEM\CurrentControlSet\Control\Terminal Server' -name fSingleSessionPerUser -propertyType DWord -value 0 -force
