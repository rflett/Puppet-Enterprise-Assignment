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

  # Install sshfs package
  package { 'sshfs':
    ensure => 'present',
  }

}
