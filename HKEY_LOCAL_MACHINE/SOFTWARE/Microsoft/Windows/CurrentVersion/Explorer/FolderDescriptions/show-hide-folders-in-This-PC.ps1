#
#   Remove or show items (Shell Folders?) from "This PC" in the File explorer.
#

set-strictMode -version latest

  $regPath = 'HKLM:/Software/Microsoft/Windows/CurrentVersion/Explorer/FolderDescriptions'
# $regPath = 'HKLM:/SOFTWARE/WOW6432Node/Microsoft/Windows/CurrentVersion/Explorer/FolderDescriptions\'
# $regPath = 'HKCU:/Software/Microsoft/Windows/CurrentVersion/Explorer/FolderDescriptions'                # No effect under HKCU



function set-thisPCPolicy ($guid, $show_or_hide) {

 #
 # The value of $show_or_hide must be (case sensitive) 'Show' or 'Hide'
 #

   $regPath_ = "$regPath/$guid/PropertyBag"

   if (-not (test-path $regPath_)) {
      write-host "$regPath_ does not exist, creating it"
      $null = new-item $regPath_ -force
   }

   $null = new-itemProperty -path "$regPath_" -name 'ThisPCPolicy'  -value $show_or_hide  -force
}


  set-thisPCPolicy '{31C0DD25-9439-4F12-BF41-7FF4EDA38722}' Hide   #  3D Objects

  set-thisPCPolicy '{33E28130-4E1E-4676-835A-98395C3BC3BB}' Hide   #  My Pictures
  set-thisPCPolicy '{0ddd015d-b06c-45d5-8c4c-f59713854639}' Hide   #  Local Pictures

  set-thisPCPolicy '{35286a68-3c57-41a1-bbb1-0eae73d76c95}' Hide   #  Local Videos

  set-thisPCPolicy '{374DE290-123F-4565-9164-39C4925E467B}' Hide   #  Downloads
# set-thisPCPolicy '{3D644C9B-1FB8-4f30-9B45-F670235F79C0}' Hide   #  Common Downloads?

# set-thisPCPolicy '{2112AB0A-C86A-4ffe-A368-0DE96E47012E}' Hide   #  MusicLibrary
  set-thisPCPolicy '{4BD8D571-6D19-48D3-BE97-422220080E43}' Hide   #  My Music
  set-thisPCPolicy '{a0c69a99-21c8-4671-8703-7934162fcf1d}' Hide   #  Local Music
  set-thisPCPolicy '{3214FAB5-9757-4298-BB61-92A9DEAA44FF}' Hide   #  commonMusic

  set-thisPCPolicy '{7d83ee9b-2244-4e70-b1f5-5393042af1e4}' Hide   #  Local Downloads
  set-thisPCPolicy '{f42ee2d3-909f-4907-8871-4c22fc0bf756}' Hide   #  Local Documents
# set-thisPCPolicy '{d3162b92-9365-467a-956b-92703aca08af}' Hide   #  Local Documents
# set-thisPCPolicy '{ED4824AF-DCE4-45A8-81E2-FC7965083634}' Hide   #  Local Documents

  set-thisPCPolicy '{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}' Hide   #  Desktop

# set-thisPCPolicy '{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}' Hide   #  NetworkPlacesFolder
