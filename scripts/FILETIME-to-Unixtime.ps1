#
#  Convert 64-bit FILETIME to Unix time.
#
#  Based on  Andreas Schuster's excellent work
#
function FILETIME-to-Unixtime([byte[]] $FILETIME) {

   if ($shutdown_FILETIME.length -ne 8) {
      write-host "FILETIME expected to be 8 bytes"
      return $null
   }

   [Uint32] $dwLowDateTime  = $shutdown_FILETIME[0] + $shutdown_FILETIME[1] * 0x100 + $shutdown_FILETIME[2] * 0x10000 + $shutdown_FILETIME[3] * 0x1000000
   [Uint32] $dwHighDateTime = $shutdown_FILETIME[4] + $shutdown_FILETIME[5] * 0x100 + $shutdown_FILETIME[6] * 0x10000 + $shutdown_FILETIME[7] * 0x1000000
   
   [UInt32] $dwLowDateTime_  = $dwLowDateTime  - (0xd53e8000 -as [Uint32])
   [UInt32] $dwHighDateTime_ = $dwHighDateTime - (0x019db1de -as [UInt32])
   
   [UInt64] $unixTime = ($dwHighDateTime_ * 429.4967296 + $dwLowDateTime/1e7) -as [UInt64]

   return $unixTime

}
