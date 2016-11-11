# Class: userman
# ===========================
#
# Full description of class userman here.
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
#    class { 'userman':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Ryan Flett <s3633011@student.rmit.edu.au>
#
# Copyright
# ---------
#
# Copyright 2016 Ryan Flett
#
class userman {
	user { 'becca':
		ensure		=> 'present',
		uid		=> '10013011',
		shell		=> '/bin/bash',
		home		=> '/home/becca',
		groups		=> ['sysadmin', 'cars'],
		password	=> '$6$9D0f3cny4QKXlSRH$sfHCKWH3T5hzcK1QPjiVbZa1W9x4P4XgYRNoxbbfCeXBDJx/9IzyTrRHHKw1tF3gw/HKZoA1OMtlls1KPxHHR/',
	}		
}
