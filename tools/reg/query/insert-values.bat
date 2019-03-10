@echo off
rem
rem     Creating keys
rem     =============
rem     A key can be created by specifying
rem     it's path after "reg add".

        reg  add HKCU\Software\tq84                                               > nul

rem
rem     It's not necessary to add path componenents
rem     one by one. reg is clever enough to create
rem     all needed keys (here: apple and banana) before
rem     creating the last one (cherry)

       reg add HKCU\Software\tq84\apple\banana\cherry                             > nul


rem
rem    Add a few values
rem      /v  specifies the name of the value
rem      /d  specifies its value
rem      /t  specifies the values data type
rem      /ve is used to write a key's default value
rem
rem
       reg add HKCU\Software\tq84\apple               /v  valOne   /t REG_SZ /d foo      > nul
       reg add HKCU\Software\tq84\apple\banana        /v  valTwo   /t REG_SZ /d bar      > nul
       reg add HKCU\Software\tq84\apple               /v  valThree /t REG_SZ /d baz      > nul
       reg add HKCU\Software\tq84\apple\banana        /ve          /t REG_SZ /d apple    > nul
       reg add HKCU\Software\tq84\apple\banana\cherry /v  apple    /t REG_SZ /d fruit    > nul

rem
rem    Wait for the user to check the newly created keys
rem    with regedit:
rem

