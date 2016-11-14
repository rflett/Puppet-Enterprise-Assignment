# Install and configure emacs
class packages::emacs {

  package { 'emacs': 
    ensure => 'present',
  }

}