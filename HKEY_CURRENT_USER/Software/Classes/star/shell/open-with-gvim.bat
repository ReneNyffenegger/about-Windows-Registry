@reg add HKEY_CURRENT_USER\Software\Classes\*\shell\gvim         /f /t REG_SZ /ve /d "Edit with GVIM"
@reg add HKEY_CURRENT_USER\Software\Classes\*\shell\gvim\command /f /t REG_SZ /ve /d "\"P:\ath\to\\gvim.exe\" \"^%1\""
