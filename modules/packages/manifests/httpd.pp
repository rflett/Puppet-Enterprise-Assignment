# Install and configure httpd (apache)
class packages::httpd {

  package { 'httpd':
    ensure => 'present',
  }

  file { '/etc/httpd/conf/':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['httpd'],
  }

  file { '/etc/httpd/conf/httpd.conf':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['httpd'],
  }

  file { '/var/www/s3633011':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['httpd'],
  }

  service { 'httpd':
    ensure    => 'running',
    enable    => true,
    subscribe => File['/etc/httpd/conf/httpd.conf'],
  }

  augeas { 'httpd.conf':
    context => '/files/etc/httpd/conf/httpd.conf',
    changes => [
      "set directive[7]/arg '\"/var/www/s3633011\"'",
      "set Directory[3]/arg '\"/var/www/s3633011\"'",
    ],
    require => File['/etc/httpd/conf/httpd.conf', '/var/www/s3633011'],
  }

}
