function printIfText {
   param (
     [string] $title,
     [string] $text
   )

   if ($text -ne $null -and $text -ne '') {
      '  {0,-13}: {1}' -f $title, $text
   }
}

function iterate {

   param (
     [Microsoft.Win32.RegistryKey] $key
   )

   foreach ($appId in $key.GetSubKeyNames()) {

      $appKey          = $key.OpenSubKey($appId)

      $displayname     = $appKey.GetValue('DisplayName'    )
      $installDate     = $appKey.GetValue('InstallDate'    )
      $installLocation = $appKey.GetValue('InstallLocation')
      $installSource   = $appKey.GetValue('InstallSource'  )
      $uninstallString = $appKey.GetValue('UninstallString')
      $comments        = $appKey.GetValue('Comments'       )
      $readme          = $appKey.GetValue('Readme'         )

      if ($displayname -eq $null) {
         $appId
      }
      else {
        "$displayName - $appId"
      }

      printIfText "Uninstall cmd" $uninstallString
      printIfText "Install src"   $installSource
      printIfText "Install loc"   $installLocation
      printIfText "Install date"  $installDate
      printIfText "Comments"      $comments
      printIfText "Readme"        $readme


      if ($readme -ne $null -and $readme -ne '') {
#        return
      }

      ''
      $appKey.Close()
   }
}

iterate (get-item hklm:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall            )
iterate (get-item hklm:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall)
