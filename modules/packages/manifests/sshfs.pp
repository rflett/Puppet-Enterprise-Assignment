# Install and configure sshfs
class packages::sshfs {

  package { 'sshfs':
    ensure => 'present',
  }

}
