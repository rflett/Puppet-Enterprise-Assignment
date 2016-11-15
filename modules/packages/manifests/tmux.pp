# Class: packages::tmux
# ===========================
#
# Installs tmux and dependencies
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
class packages::tmux {

  # Install ncurses-devel dependency
  package { 'ncurses-devel':
    ensure => 'present',
  }

  # Install glibc dependency
  package { 'glibc-static':
    ensure => 'present',
  }

  # Install tmux package
  package { 'tmux':
    ensure  => 'present',
    require => Package['ncurses-devel', 'glibc-static'],
  }

}
