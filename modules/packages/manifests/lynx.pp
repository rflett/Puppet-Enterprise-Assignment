# Class: packages::lynx
# ===========================
#
# Installs lynx
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
class packages::lynx {

  # Installs lynx package
  package { 'lynx':
    ensure => 'present',
  }

}
