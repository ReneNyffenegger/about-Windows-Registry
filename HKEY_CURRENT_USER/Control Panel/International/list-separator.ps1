param (
  [char] $listSeparator
)

set-itemProperty 'hkcu:\Control Panel\International' sList $listSeparator
