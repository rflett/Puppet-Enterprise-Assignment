# Class: puppetconf
# ===========================
#
# Edits the puppet configuration file using Augeas
#
# Authors
# -------
#
# Ryan Flett <s3633011@student.rmit.edu.au>
#
# Copyright
# ---------
#
# Copyright Ryan Flett 2016
#
class puppetconf {

  # Set puppet's run interval to 20 minutes
  augeas { 'puppet.conf':
    changes => [
      'set /files/etc/puppetlabs/puppet/puppet.conf/agent/runinterval 1200',
    ],
  }

}
