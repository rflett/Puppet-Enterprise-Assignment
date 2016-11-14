# Install and configure gdb
class packages::gdb {

  package { 'gdb': 
    ensure => 'present',
  }

}