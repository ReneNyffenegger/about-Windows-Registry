if (-not (test-path HKCU:/Software/Microsoft/Windows/CurrentVersion/Applets/Regedit/Favorites )) {
   $null = new-item -force HKCU:/Software/Microsoft/Windows/CurrentVersion/Applets/Regedit/Favorites
}

$null = set-itemProperty HKCU:/Software/Microsoft/Windows/CurrentVersion/Applets/Regedit/Favorites -name regFavorites -value 'HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites'
$null = set-itemProperty HKCU:/Software/Microsoft/Windows/CurrentVersion/Applets/Regedit/Favorites -name userEnv      -value 'HKCU\Environment'
$null = set-itemProperty HKCU:/Software/Microsoft/Windows/CurrentVersion/Applets/Regedit/Favorites -name machineEnv   -value 'HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment'
