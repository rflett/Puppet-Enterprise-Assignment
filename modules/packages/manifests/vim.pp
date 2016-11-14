# Install and configure vim
class packages::vim {

  package { 'vim': 
    ensure => 'present',
  }

}