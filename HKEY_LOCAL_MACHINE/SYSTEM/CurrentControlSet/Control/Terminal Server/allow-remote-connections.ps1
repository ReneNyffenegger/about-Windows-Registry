$null = new-itemProperty -path 'hklm:\SYSTEM\CurrentControlSet\Control\Terminal Server' -name fDenyTSConnections -propertyType DWord -value 0 -force
