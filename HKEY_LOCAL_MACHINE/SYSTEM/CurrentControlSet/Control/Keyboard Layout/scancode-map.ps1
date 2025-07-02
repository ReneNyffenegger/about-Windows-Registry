function set-scancodeMap (
   [byte[]] $swaps
) {

  [byte] $nofSwaps = $swaps.length / 4

   if ($nofSwaps -ne ($nofSwaps -as [int] )) {
      write-host "incorrect number of swaps"
      return
   }

  [byte[]] $mapping = 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
       ($nofSwaps+1), 0x00, 0x00, 0x00 +
        $swaps                         + 
                0x00, 0x00, 0x00, 0x00

   $null = new-itemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout" -name "Scancode Map" -value $mapping -force
}

$s_ESC  = 0x01, 0x00
$s_CAPS = 0x3a, 0x00
$s_RWIN = 0x5c, 0xe0
$s_RCTR = 0x1d, 0xe0

set-scancodeMap (
   $s_ESC    + $s_CAPS   +  # 1st mapping: caps lock     -> escape
   $s_CAPS   + $s_ESC    +  # 2nd mapping: escape        -> caps lock
   $s_RCTR   + $s_RWIN      # 3rd mapping: right windows -> right control
)
