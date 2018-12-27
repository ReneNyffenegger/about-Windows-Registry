@set newWindowWidth=200
@set newWindowHeight=80

@set newScreenBufferWidth=%newWindowWidth%
@set newScreenBufferHeight=9999

@set /a newWindowSize=      (65536 * %newWindowHeight%       + %newWindowWidth%      )
@set /a newScreenBufferSize=(65536 * %newScreenBufferHeight% + %newScreenBufferWidth%)

@echo newWindowSize       = %newWindowSize%
@echo newScreenBufferSize = %newScreenBufferSize%

@reg add HKCU\Console /v WindowSize       /t REG_DWORD /d %newWindowSize%       /f
@reg add HKCU\Console /v ScreenBufferSize /t REG_DWORD /d %newScreenBufferSize% /f
