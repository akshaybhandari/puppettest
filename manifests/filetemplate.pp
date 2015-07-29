class test::filetemplate {
  file { '/tmp/testtemplate.txt':
    ensure  => present,
    content => template('test/testtemplate.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
  }
}
