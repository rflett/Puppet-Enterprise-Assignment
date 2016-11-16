# Class: packages::sshfs
# ===========================
#
# Installs sshfs
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
class packages::sshfs {

  $dependencies = ['fuse', 'fuse-libs-2.9.2-7.el7.x86_64']

  package { $dependencies :
    ensure => 'present',
  }

  # Install sshfs package
  package { 'fuse-sshfs':
    ensure   => 'present',
    provider => 'rpm',
    source   => 'ftp://rpmfind.net/linux/dag/redhat/el7/en/x86_64/dag/RPMS/fuse-sshfs-2.5-1.el7.rf.x86_64.rpm',
    require  => Package['fuse-libs-2.9.2-7.el7.x86_64'],
  }

}
