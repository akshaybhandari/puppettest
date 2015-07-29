class test::sshvar {
  case $osfamily {
    'Debian': {
      $ssh_service = 'ssh'
    }
    'RedHat': {
      $ssh_service = 'sshd'
    }
  }
  package { 'openssh-server':
    ensure => present,
#    allow_virtual => false,
  }
  service { $ssh_service:
    ensure  => running,
    require => Package['openssh-server'],
  }
}
