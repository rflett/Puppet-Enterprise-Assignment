# Install and configure mysql
class packages::mysql {

  package { 'mysql':
    ensure => 'present',
  }

  file { '/etc/mysql':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['mysql'],
  }

  file { '/etc/mysql/my.cnf':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['mysql'],
  }

}
