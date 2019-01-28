set EXCEL_VERSION=15.0

@reg add HKCU\Software\Microsoft\Office\%EXCEL_VERSION%\Excel\Options /v DefaultCPG     /t REG_DWORD /d 65001 /f > nul
@reg add HKCU\Software\Microsoft\Office\%EXCEL_VERSION%\Excel\Options /v DefaultFormat  /t REG_DWORD /d    34 /f > nul
@reg add HKCU\Software\Microsoft\Office\%EXCEL_VERSION%\Excel\Options /v DeveloperTools /t REG_DWORD /d     1 /f > nul
