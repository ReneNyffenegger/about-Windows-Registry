$regPath = 'HKCU:\Software\Microsoft\Command Processor'

if (! (test-path $regPath) ) {
   write-output "$regPath does not exist, creating"
   $eatMe = new-item -path $regPath
}

$eatMe = new-itemProperty -path $regPath -name     CompletionChar -value 9 -propertyType DWord
$eatMe = new-itemProperty -path $regPath -name PathCompletionChar -value 9 -propertyType DWord
