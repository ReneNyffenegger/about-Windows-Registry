set-strictMode -version latest

$apps = get-item 'hkcu:\AppEvents\Schemes\Apps'

foreach ($appName in $apps.GetSubKeyNames()) {

   $appName

   $app = $apps.OpenSubKey($appName);

   foreach ($eventName in $app.GetSubKeyNames()) {

      $event = $app.OpenSubKey($eventName)

      $current = $event.OpenSubKey('.Current') # .GetValue('')
      $default = $event.OpenSubKey('.Default') # .GetValue('')

      if ($current) { $currentVal = $current.GetValue('') } else { $currentVal = '' }
      if ($default) { $defaultVal = $default.GetValue('') } else { $defaultVal = '' }

      "   {0,-30} {1,-60} {2,-60}" -f $eventName, $currentVal, $defaultVal
   }
}
