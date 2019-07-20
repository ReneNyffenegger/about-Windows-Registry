@echo  off


rem
echo   ** Show the values and keys of a given key
rem
@      reg query HKCU\Software\tq84\apple
rem
rem    HKEY_CURRENT_USER\Software\tq84\apple
rem        valOne    REG_SZ    foo
rem        valThree    REG_SZ    baz
rem    
rem    HKEY_CURRENT_USER\Software\tq84\apple\banana


rem
echo   ** Show a key and all its subkeys and values recursively
rem
@      reg query HKCU\Software\tq84       /s
rem
rem    HKEY_CURRENT_USER\Software\tq84
rem        (Default)    REG_SZ
rem    
rem    HKEY_CURRENT_USER\Software\tq84\apple
rem        valOne    REG_SZ    foo
rem        valThree    REG_SZ    baz
rem    
rem    HKEY_CURRENT_USER\Software\tq84\apple\banana
rem        valTwo    REG_SZ    bar
rem        (Default)    REG_SZ    apple
rem    
rem    HKEY_CURRENT_USER\Software\tq84\apple\banana\cherry
rem        (Default)    REG_SZ
rem        apple    REG_SZ    fruit

rem
echo   ** Find values whose name is apple **
rem
@      reg query HKCU\Software\tq84        /s   /v apple
rem
rem    HKEY_CURRENT_USER\Software\tq84\apple\banana\cherry
rem        apple    REG_SZ    fruit
rem

rem
echo   ** Find everything with apple: keys, value-names and values.
rem    /v  specifically searches for values, /f searches for
rem    everything.
rem
@      reg query HKCU\Software\tq84        /s   /f apple

rem
echo   ** Restrict previous query to key names only by adding the /k flag
rem
@      reg query HKCU\Software\tq84        /s   /f apple    /k
rem
rem    HKEY_CURRENT_USER\Software\tq84\apple
rem

rem
echo   ** Restrict previous query to searching in data using the /d flag:
rem
@      reg query HKCU\Software\tq84        /s   /f apple    /d
rem
rem HKEY_CURRENT_USER\Software\tq84\apple\banana
rem     (Default)    REG_SZ    apple
rem

rem
echo   ** Searching with a substring (part) of the searched item
rem
@      reg query HKCU\Software\tq84 /s /f ppl
rem
rem    HKEY_CURRENT_USER\Software\tq84\apple
rem    
rem    HKEY_CURRENT_USER\Software\tq84\apple\banana
rem        (Default)    REG_SZ    apple
rem    
rem    HKEY_CURRENT_USER\Software\tq84\apple\banana\cherry
rem        apple    REG_SZ    fruit
