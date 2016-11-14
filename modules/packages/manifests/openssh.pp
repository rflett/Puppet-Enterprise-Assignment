# Install and configure openssh
class packages::openssh {

  package { 'openssl-libs':
    ensure => 'present',
  }

  package { 'openssh':
    ensure  => 'present',
    require => Package['openssl-libs'],
  }

  package { 'openssh-server':
    ensure  => 'present',
    require => Package['openssh'],
  }

  file { '/etc/ssh':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['openssh-server'],
  }

  file { '/etc/ssh/sshd_config':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['openssh-server'],
  }

  service { 'sshd':
    ensure    => 'running',
    enable    => true,
    subscribe => File['/etc/ssh/sshd_config'],
  }

  augeas { 'sshd_config':
    context => '/files/etc/ssh/sshd_config',
    changes => [
      'set PermitRootLogin no',
    ],
    require => File['/etc/ssh/sshd_config'],
  }

}
