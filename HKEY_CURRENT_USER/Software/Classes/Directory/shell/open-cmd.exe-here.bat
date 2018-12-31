@rem
@rem   %L is replaced with the path of the directory
@rem
@rem   The % sign needs to be escaped in a batch script with another
@rem   % sign, thus %%L is used in the reg add command:
@rem
@reg add "HKEY_CURRENT_USER\Software\Classes\Directory\shell\Open cmd.exe here\command" /t REG_SZ /ve /d "cmd.exe /k cd %%L" /f
