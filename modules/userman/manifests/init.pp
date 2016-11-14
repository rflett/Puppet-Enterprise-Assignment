# Class: userman
# ===========================
#
# Full description of class userman here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'userman':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
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
  group { 'sysadmin':
    ensure => 'present',
    name   => 'sysadmin',
  }

  group { 'cars':
    ensure => 'present',
    name   => 'cars',
  }

  group { 'trucks':
    ensure => 'present',
    name   => 'trucks',
  }

  group { 'ambulances':
    ensure => 'present',
    name   => 'ambulances',
  }

  file { '/home/becca':
    ensure  => 'directory',
    require => User['becca'],
  }

  file { '/home/fred':
    ensure  => 'directory',
    require => User['fred'],
  }

  file { '/home/wilma':
    ensure  => 'directory',
    require => User['wilma'],
  }

  user { 'becca':
    ensure     => 'present',
    uid        => '10013011',
    shell      => '/bin/bash',
    managehome => true,
    home       => '/home/becca',
    groups     => ['sysadmin', 'cars'],
    password   => '$6$9D0f3cny4QKXlSRH$sfHCKWH3T5hzcK1QPjiVbZa1W9x4P4XgYRNoxbbfCeXBDJx/9IzyTrRHHKw1tF3gw/HKZoA1OMtlls1KPxHHR/',
  }

  user { 'fred':
    ensure     => 'present',
    uid        => '10023011',
    shell      => '/bin/csh',
    managehome => true,
    home       => '/home/fred',
    groups     => ['trucks', 'cars', 'wheel'],
    password   => '$6$9D0f3cny4QKXlSRH$sfHCKWH3T5hzcK1QPjiVbZa1W9x4P4XgYRNoxbbfCeXBDJx/9IzyTrRHHKw1tF3gw/HKZoA1OMtlls1KPxHHR/',
  }

  user { 'wilma':
    ensure     => 'present',
    uid        => '10033011',
    managehome => true,
    home       => '/home/wilma',
    groups     => ['trucks', 'cars', 'ambulances'],
    password   => '$6$9D0f3cny4QKXlSRH$sfHCKWH3T5hzcK1QPjiVbZa1W9x4P4XgYRNoxbbfCeXBDJx/9IzyTrRHHKw1tF3gw/HKZoA1OMtlls1KPxHHR/',
  }

  ssh_authorized_key { 'wilma_ssh':
    user => 'wilma',
    type => 'rsa',
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDShliewlx31UPTBS1Gms9mhjOCjOG5Lqh9s1kjafKuk1d2XOiydAK0cf44XKrGWcfx4jBUl2aWD0ZjDRz9GMGXSix6GIP/aDXeATyCckiBs9dZUAKQrd1QoDnl+B8rNp0lmBkipBkoZqrRTPFpfG2iMPC7rAOcOPxlGaThRQYtjDplFFaDUd/chQMq7w/sc67nD4zXlJrE7S1wtJ+10WnZwPu4XJNNkMr9DnaQuQIh9Bvbl5UoWeql3AhAm2GIj54KljXruJ8P7533ddCgFOO320/bRksUey9ofnzGV0vSk3lppsc5+t6qpe2xwCGp0q40eAidd1bNVuaUD7xz/zqZ',
  }

}
