class test::hiera {
  $package_list = hiera(package_list)
  notify { $package_list: }
  package { $package_list:
    ensure => latest,
  }
}
