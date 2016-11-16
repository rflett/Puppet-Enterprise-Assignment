# Class: userman::sshfs_setup
# ===========================
#
# Mounts a remote folder on start up
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `titan_rsa_id_content`
#  Contents of the public rsa key file for the titan server for this user
#
# * 'titan_script'
#  Contents of the script that mounts the remote dir to a folder
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
class userman::sshfs_setup {

  # Content of the public rsa key file
  $titan_rsa_id_content = 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDb0IbwQjMAnQS/lOOsQa6ypgOFZsffJD2OMGlEoqO/yDHwIujIA/iGLclC/OqVHq7XWWd9Z5VzFWshXBrxeqYzS/hGbOwyL1NyKKxKGR1CjmkDEQHyVad7lbK+kaZ+ZUZJpFx9u6B3SuNqY2lTmRensceSzXWuDRSzQw3d7cnKbAttJNBS2NkFfCXQEwwq4N6gpsA291jJ6H8UayessqMicKHUNsnjBy7GfU6QqOQN1fWt94ENPEmNjr07x2/pzPrM1xAuhDntFxridt8QoReF7tszsXCmIE/yWcFWN6EFUnWts4QNsKDEymrmGVjY1nMVJO1xXmkhhVModFgbICD3 s3633011@csitprdap01'

  # Contents of the script that mounts the remote dir using the ssh key
  $titan_script = "#!/bin/bash\sshfs -o allow_other,IdentityFile=/home/becca/.ssh/titan_id.pub s3633011@titan.csit.rmit.edu.au:/ /home/becca/titan"

  # Ensure .ssh directory exists
  file { '/home/becca/.ssh':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
  }

  # Ensure the rsa public key file exists
  file { '/home/becca/.ssh/titan_id.pub':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => File['/home/becca/.ssh'],
  }

  # Ensure the directory to mount the remote dir to exists
  file { '/home/becca/titan':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => File['/home/becca'],
  }

  # Ensure the init.d dir exists
  file { '/etc/init.d':
    ensure => 'directory',
    mode   => '0755',
  }

  # Create the script that mounts the remote dir locally
  file { '/etc/init.d/titan.sh':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => File['/etc/init.d', '/home/becca/.ssh/titan_id.pub', '/home/becca/titan'],
    content => $titan_script,
  }

  # Run the script on boot
  exec { 'titan.sh':
    command     => 'update-rc.d titan.sh defaults 3',
    cwd         => '/tmp',
    path        => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    refreshonly => true,
    require     => File['/etc/init.d/titan.sh'],
  }

}
