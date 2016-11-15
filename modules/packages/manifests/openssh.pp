# Class: packages::openssh
# ===========================
#
# Installs and configures openssh
#
# Authors
# -------
#
# Ryan Flett <s3633011@student.rmit.edu.au>
#
# Copyright
# -------
#
# Copyright Ryan Flett 2016
class packages::openssh {

  # Install openssl libraries (openssh dependency)
  package { 'openssl-libs':
    ensure => 'present',
  }

  # Install openssh package
  package { 'openssh':
    ensure  => 'present',
    require => Package['openssl-libs'],
  }

  # Install openssh server
  package { 'openssh-server':
    ensure  => 'present',
    require => Package['openssh'],
  }

  # Ensure config dir exists
  file { '/etc/ssh':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['openssh-server'],
  }

  # Ensure config file exists
  file { '/etc/ssh/sshd_config':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['openssh-server'],
  }

  # Ensure sshd service is running on boot
  service { 'sshd':
    ensure    => 'running',
    enable    => true,
    subscribe => File['/etc/ssh/sshd_config'],
  }

  # Edit config file to disable root login
  augeas { 'sshd_config':
    context => '/files/etc/ssh/sshd_config',
    changes => [
      'set PermitRootLogin no',
    ],
    require => File['/etc/ssh/sshd_config'],
  }

}
