# Class: packages::dia2code
# ===========================
#
# Installs dia2code and dependencies
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `rpm_url`
#  Location of the dia2code rpm
#
# * 'dependencies'
#  List of dependent packages for dia2code
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
class packages::dia2code {

  $rpm_url = 'http://prdownloads.sourceforge.net/dia2code/dia2code-0.8.1-1.i386.rpm'
  $dependencies = ['glibc-2.17-106.el7_2.8.i686', 'zlib-1.2.7-15.el7.i686', 'libxml2-2.9.1-6.el7_2.3.i686']
  
  # Install dependencies
  package { $dependencies :
    ensure => 'present',
  }

  # Install dia2code package from rpm_url
  package { 'dia2code':
    ensure   => 'present',
    provider => 'rpm',
    source   => $rpm_url,
    require  => Package[$dependencies],
  }

}
