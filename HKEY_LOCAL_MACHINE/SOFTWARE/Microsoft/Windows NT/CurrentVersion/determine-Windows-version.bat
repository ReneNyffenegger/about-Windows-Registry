@echo off
setlocal enableDelayedExpansion

rem
rem needed for aligned output.
rem
set spaces=                  

for %%v in (CurrentVersion ProductName CurrentBuildNumber EditionID InstallationType) do (
  for /f "tokens=3 usebackq" %%a in (`reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v %%v`) do (
    set keyNameWithSpaces=%%v!spaces!
      rem
      rem ~0,19 returns the first 19 characters
      rem  of keyNameWithSpaces and thus creates
      rem  aligned output.
      rem
      echo !keyNameWithSpaces:~0,19!: %%a
  )
)
