# Class: packages::mysql
# ===========================
#
# Installs and configures MySQL
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
class packages::mysql {

  # Install mysql package
  package { 'mysql':
    ensure => 'present',
  }

  # Ensure mysql config dir exists
  file { '/etc/mysql':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['mysql'],
  }

  # Ensure mysql config file exists
  file { '/etc/mysql/my.cnf':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['mysql'],
  }

}
