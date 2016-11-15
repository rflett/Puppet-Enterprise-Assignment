# Class: sysman
# ===========================
#
# Adds entries to the hosts file to allow easy access to RMIT servers
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
class sysman {

  # Add titan to hosts file
  host { 'titan':
    ensure       => 'present',
    host_aliases => 'titan.csit.rmit.edu.au',
    ip           => '131.170.5.131',
  }

  # Add jupiter to hosts file
  host { 'jupiter':
    ensure       => 'present',
    host_aliases => 'jupiter.csit.rmit.edu.au',
    ip           => '131.170.5.132',
  }

  # Add saturn to hosts file
  host { 'saturn':
    ensure       => 'present',
    host_aliases => 'saturn.csit.rmit.edu.au',
    ip           => '131.170.5.135',
  }

}
