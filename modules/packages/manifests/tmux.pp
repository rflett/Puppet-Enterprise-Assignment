# Install and configure tmux
class packages::tmux {

  package { 'ncurses-devel':
    ensure => 'present',
  }

  package { 'glibc-static':
    ensure => 'present',
  }

  package { 'tmux':
    ensure  => 'present',
    require => Package['ncurses-devel', 'glibc-static'],
  }

}
