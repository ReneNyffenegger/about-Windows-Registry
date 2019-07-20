@echo off
rem
rem    Delete a key. reg delete will recursively delete
rem    all keys 
       reg delete HKCU\Software\tq84  /f                  > nul

