# Class: userman
# ===========================
#
# Creates users and their home directories as well as providing an ssh key
# and adding a directory to the $PATH environment variable.
#
# Authors
# -------
#
# Ryan Flett <s3633011@student.rmit.edu.au>
#
# Copyright
# ---------
#
# Copyright 2016 Ryan Flett
#
class userman {

  # Add sysadmin group
  group { 'sysadmin':
    ensure => 'present',
    name   => 'sysadmin',
  }

  # Add cars group
  group { 'cars':
    ensure => 'present',
    name   => 'cars',
  }

  # Add trucks group
  group { 'trucks':
    ensure => 'present',
    name   => 'trucks',
  }

  # Add ambulances group
  group { 'ambulances':
    ensure => 'present',
    name   => 'ambulances',
  }

  # Ensure becca's home dir exists
  file { '/home/becca':
    ensure  => 'directory',
    require => User['becca'],
  }

  # Ensure fred's home dir exists
  file { '/home/fred':
    ensure  => 'directory',
    require => User['fred'],
  }

  # Ensure wilma's home dir exists
  file { '/home/wilma':
    ensure  => 'directory',
    require => User['wilma'],
  }

  # Add /bin/csh to list of shells
  augeas { '/etc/shells':
    changes => [
      'set /files/etc/shells[1]/1000 /bin/csh',
    ],
  }

  # Add user becca
  user { 'becca':
    ensure     => 'present',
    uid        => '10013011',
    shell      => '/bin/bash',
    managehome => true,
    home       => '/home/becca',
    groups     => ['sysadmin', 'cars'],
    password   => '$6$9D0f3cny4QKXlSRH$sfHCKWH3T5hzcK1QPjiVbZa1W9x4P4XgYRNoxbbfCeXBDJx/9IzyTrRHHKw1tF3gw/HKZoA1OMtlls1KPxHHR/',
  }

  # Add user fred
  user { 'fred':
    ensure     => 'present',
    uid        => '10023011',
    shell      => '/bin/csh',
    managehome => true,
    home       => '/home/fred',
    groups     => ['trucks', 'cars', 'wheel'],
    password   => '$6$9D0f3cny4QKXlSRH$sfHCKWH3T5hzcK1QPjiVbZa1W9x4P4XgYRNoxbbfCeXBDJx/9IzyTrRHHKw1tF3gw/HKZoA1OMtlls1KPxHHR/',
    require    => Augeas['/etc/shells'],
  }

  # Add user wilma
  user { 'wilma':
    ensure     => 'present',
    uid        => '10033011',
    managehome => true,
    home       => '/home/wilma',
    groups     => ['trucks', 'cars', 'ambulances'],
    password   => '$6$9D0f3cny4QKXlSRH$sfHCKWH3T5hzcK1QPjiVbZa1W9x4P4XgYRNoxbbfCeXBDJx/9IzyTrRHHKw1tF3gw/HKZoA1OMtlls1KPxHHR/',
  }

  # Add an ssh key for wilma
  ssh_authorized_key { 'wilma_ssh':
    user => 'wilma',
    type => 'rsa',
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDShliewlx31UPTBS1Gms9mhjOCjOG5Lqh9s1kjafKuk1d2XOiydAK0cf44XKrGWcfx4jBUl2aWD0ZjDRz9GMGXSix6GIP/aDXeATyCckiBs9dZUAKQrd1QoDnl+B8rNp0lmBkipBkoZqrRTPFpfG2iMPC7rAOcOPxlGaThRQYtjDplFFaDUd/chQMq7w/sc67nD4zXlJrE7S1wtJ+10WnZwPu4XJNNkMr9DnaQuQIh9Bvbl5UoWeql3AhAm2GIj54KljXruJ8P7533ddCgFOO320/bRksUey9ofnzGV0vSk3lppsc5+t6qpe2xwCGp0q40eAidd1bNVuaUD7xz/zqZ',
  }

  # Add /usr/local/bin to everyone's PATH
  file { '/etc/profile.d/bin.sh':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => 'export PATH=$PATH:/usr/local/bin',
  }

}
