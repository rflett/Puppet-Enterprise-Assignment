# Install and configure mysql
class packages::mysql {

  package { 'mysql-server':
    ensure  =>  'present',
  }
  
  file { '/etc/mysql':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['mysql-server'],
        }

  file { '/etc/mysql/my.cnf':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['mysql-server'],
  }
  
  service { 'mysqld':
    ensure    => 'running',
	enable    => true,
	subscribe => File['/etc/mysql/my.cnf'],
  }

}