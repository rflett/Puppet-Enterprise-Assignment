# Class: packages::httpd
# ===========================
#
# Installs and configures Apache
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
class packages::httpd {

  # Install httpd package
  package { 'httpd':
    ensure => 'present',
  }

  # Ensure config dir exists
  file { '/etc/httpd/conf/':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['httpd'],
  }

  # Ensure config file exists
  file { '/etc/httpd/conf/httpd.conf':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['httpd'],
  }

  # Ensure document root dir exists
  file { '/var/www/s3633011':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['httpd'],
  }

  # Start httpd service and subscribe it to the config
  service { 'httpd':
    ensure    => 'running',
    enable    => true,
    subscribe => File['/etc/httpd/conf/httpd.conf'],
  }

  # Change document root of Apache from default
  augeas { 'httpd.conf':
    context => '/files/etc/httpd/conf/httpd.conf',
    changes => [
      "set directive[7]/arg '\"/var/www/s3633011\"'",
      "set Directory[3]/arg '\"/var/www/s3633011\"'",
    ],
    require => File['/etc/httpd/conf/httpd.conf', '/var/www/s3633011'],
  }

}
