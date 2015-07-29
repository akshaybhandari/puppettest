class test::multiple {
  $package_list = ['openssh-server', 'ntp', 'vim-enhanced']
  notify { $package_list: }
  package { $package_list:
    ensure => present,
  }
}
