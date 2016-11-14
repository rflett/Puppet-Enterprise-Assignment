# Install and configure VNCserver
class packages::vncserver {

  package { 'vnc-server': 
    ensure => 'present',
  }
  
  file { '/etc/sysconfig':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['vnc-server'],
        }

  file { '/etc/sysconfig/vncservers':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['vnc-server'],
  }
  
  service { 'vncserver':
    ensure    => 'running',
	enable    => true,
	subscribe => File['/etc/sysconfig/vncservers'],
  }

}