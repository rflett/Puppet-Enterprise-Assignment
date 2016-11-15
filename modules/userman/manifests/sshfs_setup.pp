# Setup ssfs
class userman::sshfs_setup {

  $titan_rsa_id_content = 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDb0IbwQjMAnQS/lOOsQa6ypgOFZsffJD2OMGlEoqO/yDHwIujIA/iGLclC/OqVHq7XWWd9Z5VzFWshXBrxeqYzS/hGbOwyL1NyKKxKGR1CjmkDEQHyVad7lbK+kaZ+ZUZJpFx9u6B3SuNqY2lTmRensceSzXWuDRSzQw3d7cnKbAttJNBS2NkFfCXQEwwq4N6gpsA291jJ6H8UayessqMicKHUNsnjBy7GfU6QqOQN1fWt94ENPEmNjr07x2/pzPrM1xAuhDntFxridt8QoReF7tszsXCmIE/yWcFWN6EFUnWts4QNsKDEymrmGVjY1nMVJO1xXmkhhVModFgbICD3 s3633011@csitprdap01'

  $titan_script = "#!/bin/bash\nsshfs -o allow_other,IdentityFile=/home/becca/.ssh/titan_id.pub s3633011@titan.csit.rmit.edu.au:/ /home/becca/titan"

  file { '/home/becca/.ssh':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
  }

  file { '/home/becca/.ssh/titan_id.pub':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => File['/home/becca/.ssh'],
  }

  file { '/home/becca/titan':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => File['/home/becca'],
  }

  file { '/etc/init.d':
    ensure => 'directory',
    mode   => '0755',
  }

  file { '/etc/init.d/titan.sh':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => File['/etc/init.d', '/home/becca/.ssh/titan_id.pub', '/home/becca/titan'],
    content => $titan_script,
  }

  exec { 'update_titan.sh':
    command     => 'update-rc.d titan.sh defaults 3',
    cwd         => '/tmp',
    path        => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    refreshonly => true,
  }

}
