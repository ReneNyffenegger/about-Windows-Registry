$office_version  = '16.0'
$newPrefEditLang = 'en-US'

# $regKey = 

$regPath = "HKCU:\Software\Microsoft\Office\$($office_version)\Common\LanguageResources"
$regKey  = get-itemProperty -path $regPath

$prevPrefEditLang = $regKey.PreferredEditingLanguage

$eatMe = new-itemProperty -path $regPath -name         PreferredEditingLanguage -propertyType string -value $newPrefEditLang  -force
$eatMe = new-itemProperty -path $regPath -name PreviousPreferredEditingLanguage -propertyType string -value $prevPrefEditLang -force
