# Class: packages::emacs
# ===========================
#
# Installs emacs
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
class packages::emacs {

  # Install emacs package
  package { 'emacs':
    ensure => 'present',
  }

}
