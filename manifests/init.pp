class dummy( $aparam = 'something' ) {
  notify { 'Hello World': }
  $this_var = 'nothing'
  $aVar = '${this_var}-sInSingleQuotedString'
  notify { $aVar:
   require => Notify['Hello World'],
   message  => $aVar
  }
  notify { "this is a string one, could call it text, that is definitely equal to or longer than eighty characters... causing this line to fail standard puppet-lint checks": }
}
