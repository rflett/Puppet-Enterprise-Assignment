## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# PRIMARY FILEBUCKET
# This configures puppet agent and puppet inspect to back up file contents when
# they run. The Puppet Enterprise console needs this to display file contents
# and differences.

# Define filebucket 'main':
filebucket { 'main':
  server => 'localhost',
  path   => false,
}

# Make filebucket 'main' the default backup location for all File resources:
File { backup => 'main' }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

node default {
  # Get current time
  $time = generate('/bin/date', '+%H:%M:%S')

  # Display time when running puppet agent
  notify{"Agent run starting at ${time}.":}

  # Ensure augeas is installed, used for config editing
  package {'ruby-augeas':
    ensure => 'present',
  }

  # User management classes
  include userman
  include userman::sshfs_setup

  # Puppet configuration classes
  include puppetconf

  # Package installation and configuration classes
  include packages
  include packages::openssh
  include packages::httpd
  include packages::emacs
  include packages::gcc
  include packages::gdb
  include packages::mysql
  include packages::sshfs
  include packages::vim
  include packages::vncserver
  include packages::tmux
  include packages::dia2code
  include packages::lynx

  # System management classes
  include sysman

}
