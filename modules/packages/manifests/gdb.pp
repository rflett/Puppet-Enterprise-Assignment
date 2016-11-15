# Class: packages::gdb
# ===========================
#
# Installs gdb
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
class packages::gdb {

  # Installs gdb package
  package { 'gdb':
    ensure => 'present',
  }

}
