# Class: packages::vncserver
# ===========================
#
# Installs vncserver
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
class packages::vncserver {

  # Install vnc server
  package { 'vnc-server':
    ensure => 'present',
  }

  # Ensure config dir exists
  file { '/etc/sysconfig':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['vnc-server'],
  }

  # Ensure config file exists
  file { '/etc/sysconfig/vncservers':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['vnc-server'],
  }

}
