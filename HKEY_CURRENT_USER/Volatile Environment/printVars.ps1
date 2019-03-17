$wsh         = new-object -comObject wscript.shell
$volatileEnv = $wsh.environment("Volatile")

write-host   "USERNAME = " $volatileEnv.item("USERNAME")
