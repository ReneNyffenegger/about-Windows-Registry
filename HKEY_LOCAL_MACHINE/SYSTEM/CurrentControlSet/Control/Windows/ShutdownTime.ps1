set-strictMode -version latest

. ../../../../../scripts/FILETIME-to-Unixtime.ps1

[byte[]] $shutdown_FILETIME = (get-itemProperty -path HKLM:\SYSTEM\CurrentControlSet\Control\Windows).ShutdownTime

$unixTime = FILETIME-to-Unixtime $shutdown_FILETIME

$t0 = new-object -type DateTime -argumentList 1970, 1, 1, 0, 0, 0, 0

$tShutdown = $t0.AddSeconds($unixTime)

$tShutdown.ToLocalTime()

#
# Compare the calculated value with the the following one
#
(get-CimInstance win32_Operatingsystem).lastbootuptime
