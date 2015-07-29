class test::ssh {
  package { 'openssh-server':
    ensure => present,
#    allow_virtual => false,
  }
  service { 'sshd':
    ensure  => running,
    require => Package['openssh-server'],
  }
}
