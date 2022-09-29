set-strictMode -version 3

function print-redist-version {
   param ( $wow6432node, $arch, $debug )

   $t = '{0,-12} {1,-3} {2,-6}' -f $wow6432node, $arch, $debug

   $regKey = "hklm:/Software$wow6432node/Microsoft/VisualStudio/14.0/VC/Runtimes$debug/$arch"

   if (test-path $regKey) {
      $version = get-itemPropertyValue $regKey -name version
      "$t : $version"
   }
   else {
      "$t : no key"
   }
}


foreach ($debug in ('', '/debug')) {
   foreach ($arch in ('x86', 'x64', 'ARM')) {
      foreach ($wow6432node in ('/wow6432node', '/')) {
         print-redist-version $wow6432node $arch $debug
      }
   }
}
