$s_ESC  = 0x01, 0x00
$s_CAPS = 0x3a, 0x00
$s_RWIN = 0x5c, 0xe0
$s_RCTR = 0x1d, 0xe0

$mapping = [byte[]] (
  0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00,
  0x04, 0x00, 0x00, 0x00+  # 3 mapping + 1 ending = 0x04
  $s_ESC    + $s_CAPS   +  # 1st mapping: escape -> caps lock
  $s_CAPS   + $s_ESC    +  # 2nd mapping: caps lock -> escape
  $s_RCTR   + $s_RWIN   +  # 3rd mapping: right windows -> right control
  0x00, 0x00, 0x00, 0x00   # final four bytes
)

$null = new-itemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout" -name "Scancode Map" -value $mapping -force
