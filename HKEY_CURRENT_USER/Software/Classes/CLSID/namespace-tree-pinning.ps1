#
#  Pin or unpin a Shell Folder to/from the Namespace tree.
#
#  Shell Folders that are unpinned are not visible in the
#  File explorer on the left side.
#
function set-pinning($clsid, $value) {

   $regPath = "hkcu:\Software\Classes\CLSID\$clsid"

   if (-not (test-path $regPath)) {
      $null = new-item $regPath -force
   }

   $null = new-itemProperty -path "$regPath" -name 'System.IsPinnedToNameSpaceTree'  -value $value -force
}

  set-pinning  '{20D04FE0-3AEA-1069-A2D8-08002B30309D}'  0   # This PC
  set-pinning  '{018D5C66-4533-4307-9B53-224DE2ED1FE6}'  0   # OneDrive   (Value might already exist in registry)
  set-pinning  '{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}'  0   # Network
# set-pinning  '{031E4825-7B94-4dc3-B131-E946B44C8DD5}'  0   # Libraries
# set-pinning  '{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}'  0   # Home group
# set-pinning  '{E31EA727-12ED-4702-820C-4B6445F28E1A}'  0   # Drop Box
