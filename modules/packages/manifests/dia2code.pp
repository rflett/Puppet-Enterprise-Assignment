# Install dia2code
class packages::dia2code {

  $rpm_url = 'http://prdownloads.sourceforge.net/dia2code/dia2code-0.8.1-1.i386.rpm'
  $dependencies = ['glibc-2.17-106.el7_2.8.i686', 'zlib-1.2.7-15.el7.i686', 'libxml2-2.9.1-6.el7_2.3.i686']
  
  package { $dependencies :
    ensure => 'present',
  }

  package { 'dia2code':
    ensure   => 'present',
    provider => 'rpm',
    source   => $rpm_url,
    require  => Package[$dependencies],
  }

}
