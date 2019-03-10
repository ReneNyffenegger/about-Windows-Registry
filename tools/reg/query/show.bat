rem
rem    Show a specific key
rem
       reg query HKCU\Software\tq84\apple


rem
rem    Show a key and all its subkeys and values recursively
rem
       reg query HKCU\Software\tq84       /s

rem
rem    Find values whose name is apple
rem
       reg query HKCU\Software\tq84        /s   /v apple

rem
rem    Find everything with apple: keys, value-names and values.
rem    /v  specifically searches for values, /f searches for
rem    everything.
rem
       reg query HKCU\Software\tq84        /s   /f apple

rem
rem    Restrict previous query to key names only by
rem    adding the /k flag:
rem
       reg query HKCU\Software\tq84        /s   /f apple    /k

rem
rem    Restrict previous query to searching in data using
rem    the /d flag:
rem
       reg query HKCU\Software\tq84        /s   /f apple    /d


