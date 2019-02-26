@echo off

reg query HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\CentralProcessor\0 /v "Identifier" | find "64 Family"

if %errorlevel% == 1 goto x86

   echo 64 bit processor
   exit /b

:x86

   echo 32 bit processor
