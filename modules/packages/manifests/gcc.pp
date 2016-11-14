# Install and configure gcc
class packages::gcc {

  package { 'gcc':
    ensure => 'present',
    name   => 'gcc*',
  }

}
