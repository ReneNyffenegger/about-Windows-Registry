$null = set-itemProperty HKCU:/Software/Microsoft/Windows/CurrentVersion/Applets/Regedit/Favorites -name regFavorites -value 'HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites'
$null = set-itemProperty HKCU:/Software/Microsoft/Windows/CurrentVersion/Applets/Regedit/Favorites -name userEnv      -value 'HKCU\Environment'
$null = set-itemProperty HKCU:/Software/Microsoft/Windows/CurrentVersion/Applets/Regedit/Favorites -name machineEnv   -value 'HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment'
