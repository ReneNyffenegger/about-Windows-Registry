#
#  TODO:
#    There is more data in the byte array (such as *.lnk file names)
#
set-strictMode -version latest

$recentDocsKey = get-item hkcu:\Software\Microsoft\windows\CurrentVersion\Explorer\RecentDocs


foreach ($recentDocNumber in ($recentDocsKey.GetValueNames() -match '^\d+$' | sort {[int] $_})) {
   $recentDocValue = $recentDocsKey.GetValue([string]$recentDocNumber)

   $posEndOfString1 = 0

   while ($recentDocValue[$posEndOfString1+2] -ne 0) {
      $posEndOfString1 += 2
   }

   write-host ('{0,4} {1,-40}' -f
       $recentDocNumber,
      [System.Text.Encoding]::Unicode.GetString($recentDocValue[ 0                   .. ($posEndOfString1+1)])
   )

}
