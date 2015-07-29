class test::file {
  file { '/tmp/test.txt':
    ensure => present,
    source => 'puppet:///modules/test/test.txt',
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
  }
  file_line { '/tmp/test.txt':
    path    => '/tmp/test.txt',
    line    => 'this is test line replace',
    match   => 'this is*',
  }
}
