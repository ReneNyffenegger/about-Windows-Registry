@rem
@rem    Script to determine if two registry keys refer to the same key.
@rem
@rem    This script was developed to check if one key is in fact a (soft) link
@rem    to another key.
@rem    For example HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet is a link to
@rem    HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001. The script will report these two
@rem    keys to  be the same if invoked like so:
@rem
@rem       is-same-registry-key.bat "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001" "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet"
@rem


@rem
@rem    Only local variables needed:
@rem
@setlocal

@rem
@rem    Assign script parameters to variables:
@rem
@set key_1=%1
@set key_2=%2

@rem
@rem    Check if both variables were assigned:
@rem
@if [%key_2%] equ [] (
   @echo Specify two keys.
   @exit /b
)

@rem
@rem    Check if both variables refer to an actual key
@rem    in the registry:
@rem
@reg query %key_1% 2>nul 1>nul
@if %errorlevel% neq 0 (
    @echo %key_1% is not a key in the registry
    @exit /b
)

@reg query %key_2% 2>nul 1>nul
@if %errorlevel% neq 0 (
    @echo %key_2% is not a key in the registry
    @exit /b
)


@rem
@rem     Write a dummy string (the current time) under the
@rem     first key:
@rem
@reg add     %key_1%  /v tq84_dummy /t REG_SZ /d %time% /f 1>nul

@rem
@rem     And try to read it from the second key:
@rem
@reg query   %key_2%  /v tq84_dummy                        2>nul 1>nul

@rem
@rem     The error level is 0 if the value could be read. I assume
@rem     that nobody else wrote tq84_dummy into the registry...
@rem
@if %errorlevel% neq 0 (
    @echo Not the same key
) else (
    @echo Same key
)

@rem
@rem     Delete the value under the first key:
@rem
@reg delete  %key_1%  /v tq84_dummy                     /f 1>nul
