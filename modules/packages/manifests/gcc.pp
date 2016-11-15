# Class: packages::gcc
# ===========================
#
# Installs gcc
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
class packages::gcc {

  # Installs gcc package
  package { 'gcc':
    ensure => 'present',
    name   => 'gcc*',
  }

}
