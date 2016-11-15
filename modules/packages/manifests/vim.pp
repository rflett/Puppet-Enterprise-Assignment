# Class: packages::vim
# ===========================
#
# Installs vim
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
class packages::vim {

  # Install vim package
  package { 'vim':
    ensure => 'present',
  }

}
