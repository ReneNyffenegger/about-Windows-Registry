@reg add HKCU\Software\Microsoft\Windows\DWM                                   /v EnableAeroPeek   /t REG_DWORD /d 0 /f > nul

@rem
@rem    Change »Visual Effects« to »Custom«
@rem
@reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects /v VisualFXSetting  /t REG_DWORD /d 3 /f > nul
