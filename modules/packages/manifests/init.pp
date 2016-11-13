# Class: packages
# ===========================
#
# Full description of class packages here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'packages':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
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
#
class packages {

	package { 'openssl-libs':
		ensure		=> 'present',
	}

	package { 'openssh':
		ensure		=> 'present',
		require		=> Package['openssl-libs'],
	}

	package { 'openssh-server':
                ensure          => 'present',
		require		=> Package['openssh'],
        }

        file { '/etc/ssh':
                ensure          => 'directory',
                owner           => 'root',
                group           => 'root',
                mode            => '0640',
                require         => Package['openssh-server'],
        }

        file { '/etc/ssh/sshd_config':
                ensure          => 'file',
                owner           => 'root',
                group           => 'root',
                mode            => '0640',
                require         => Package['openssh-server'],
        }

	service { 'sshd':
                ensure          => 'running',
                enable          => 'true',
                subscribe       => File['/etc/ssh/sshd_config'],
        }

}


