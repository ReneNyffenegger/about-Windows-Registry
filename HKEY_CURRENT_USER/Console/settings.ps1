<#

# .\settings.ps1 '%SystemRoot%_System32_WindowsPowerShell_v1.0_powershell.exe' `
  .\settings.ps1 (get-process -pid $pid).path `
      -winW 200 -winH   70                    `
                -bufH 9999                    `
      -font  'Lucida Console'                 `
      -fontH  12



#>


param (
  [parameter(mandatory=$true )] [String] $exePath,
  [parameter(mandatory=$false)] [Int16 ] $winH,
  [parameter(mandatory=$false)] [Int16 ] $winW,
  [parameter(mandatory=$false)] [Int16 ] $bufH,
  [parameter(mandatory=$false)] [String] $font,
  [parameter(mandatory=$false)] [Int16 ] $fontH,
  [parameter(mandatory=$false)] [Int16 ] $fontW
)

set-strictMode -version 2

#
#  Registry key name is path of exe for which the
#  settings are stored.
#  However, registry keys don't allow backslashes. Thus,
#  they need to be replaced by underscores:
#
$regKey = 'HKCU:\Console\' + $exePath.replace('\', '_')
write-verbose "regKey = $regKey"

#
#   Create registry key. Do nothing if it already exists.
#
new-item $regKey -errorAction ignore


if ( $psBoundParameters.ContainsKey('winH') -and
     $psBoundParameters.ContainsKey('winW') ) {

   write-verbose "Set Window size to: $winW x $winH"
   $null = set-itemProperty $regKey WindowSize       (65536 * $winH + $winW) -force

}
if ( $psBoundParameters.ContainsKey('BufH') ) {


   if ( -not $psBoundParameters.ContainsKey('winW') ) {
      write-warning "winW is not specified"
   }
   else {

    # It rarely makes sense to have a buffer width that is different from the window width.
      $bufW = $winW

      write-verbose "Set buffer size to: $bufW x $bufH"
      $null = set-itemProperty $regKey ScreenBufferSize (65536 * $bufH + $bufW) -force

   }

}
if ( $psBoundParameters.ContainsKey('font') ) {

   switch ($font) {
      { $_ -in 'Consolas', 'Lucida Console' } {
         write-verbose "setting fontFamily to 54"
         $fontFamily =  54 #  0x36

       #
       # It seems that fontWeight is necessary for fontFamily 54
       #
         write-verbose "setting fontWeight to 400"
         $fontWeight = 400
         $null = set-itemProperty $regKey FontWeight $fontWeight -force
       }
      'Terminal' {
         write-verbose "setting fontFamily to 48"
         $fontFamily = 48 #  0x30
      }
      Default {
        write-warning "Unknown font $font"
        return
      }

   }
   $null = set-itemProperty $regKey FontFamily  $fontFamily  -force
   $null = set-itemProperty $regKey FaceName    $font        -force
}
if ( $psBoundParameters.ContainsKey('fontH') ) {

 #
 # It seems that the width of the font is only required if $fontFamily is 48
 #
   $null = set-itemProperty $regKey FontSize (65536 * $fontH + $fontW) -force

}
