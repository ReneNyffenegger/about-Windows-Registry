@rem
@rem Change to version on system (use application.dbVersion etc.)
@rem
@set officeVersion=15.0
@

@
@rem Wow6432Node only used for 32 bit access on 64 bit Windows.
@rem Uncomment in other cases.
@
@set Wow6432Node=\Wow6432Node
@

@reg add "HKEY_LOCAL_MACHINE\SOFTWARE%Wow6432Node%\Microsoft\Office\%officeVersion%\Access Connectivity Engine\Engines\Debug" /v JETSHOWPLAN /t REG_SZ /d ON /f
