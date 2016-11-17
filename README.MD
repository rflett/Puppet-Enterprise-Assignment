- Ryan Flett

CPT264 Unix Systems Administration Assignment 2 Part 2

16/11/2016- Puppet Enterprise

- Milestone 2

- Ryan Flett (S3633011)

- November 16, 2016

- CPT264

- Unix Systems Administration

- PUPPET ENTERPRISE - NOVEMBER 16, 2016

S3633011@student.rmit.edu.auRyan Flett![Image9](images/Image9)

- Ryan Flett

CPT264 Unix Systems Administration Assignment 2 Part 2

16/11/2016- Table of Contents

- /manifests/site.pp ......................................................... 3

- /modules/userman/manifests/.................................... 4

- Init.pp ............................................................................................................................................................................... 4

- Sshfs_setup.pp ................................................................................................................................................................ 5

- /modules/sysman/manifests/init.pp ........................... 6

- /modules/puppetconf/manifests/init.pp .................... 6

- /modules/packages/manifests/ .................................. 7

- Init.pp ............................................................................................................................................................................... 7

- Dia2code.pp .................................................................................................................................................................... 7

- Emacs.pp ......................................................................................................................................................................... 7

- Gcc.pp .............................................................................................................................................................................. 7

- Httpd.pp .......................................................................................................................................................................... 8

- Gdb.pp ............................................................................................................................................................................. 8

- Lynx.pp ............................................................................................................................................................................ 8

- Mysql.pp........................................................................................................................................................................... 9

- Openssh.pp ..................................................................................................................................................................... 9

- Tmux.pp......................................................................................................................................................................... 10

- Sshfs.pp .......................................................................................................................................................................... 10

- Vim.pp ............................................................................................................................................................................ 11

- Amazon Web Services .................................................. 12

- Secure installation ......................................................................................................................................................... 12

- Puppet running ............................................................................................................................................................. 12

- Successful puppet agent run ....................................................................................................................................... 13

- PUPPET ENTERPRISE - NOVEMBER 16, 2016

- Ryan Flett

CPT264 Unix Systems Administration Assignment 2 Part 2

16/11/2016- /manifests/site.pp

- Line 40: The generate function is used to run the date command and store the date in the time variable in the

- format ‘14:40:30’.

- Line 43: Send a notify message to the puppet agent that displays the time the agent was run.

- Line 46: Ensure package ‘ruby-augeas’ is present.

- Line 51-52: Include userman and sub class sshfs_setup when running the agent on the ‘default’ node.

- Line 55: Include the puppetconf class when running the agent on the ‘default’ node.

- Line 58-70: Include the packages and sub classes when running the agent on the ‘default’ node.

- Line 73: Include the sysman class when running the agent on the ‘default’ node.

- PUPPET ENTERPRISE - NOVEMBER 16, 2016

- Ryan Flett

CPT264 Unix Systems Administration Assignment 2 Part 2

16/11/2016- /modules/userman/manifests/

- Init.pp

- Line 21-38: Ensure the groups ‘sysadmin’, ‘cars’, ‘trucks’ and ‘ambulances’ are present on the system.

- Line  44-56:  Ensure  the  home  directories  exists  for  each  user  ‘becca’,  ‘fred’,  and  ‘wilma’,  and  that  they  are

- directories. Each home directory requires that the user exists before it will be ensured present.

- Line 62: Use augeas to add /bin/csh to the shells file in /etc/shells.

- Line 69: Ensure the user ‘becca’ is present on the system. Her uid is 10013011, her shell is /bin/bash and her

- home  directory  must  be  managed  at  /home/becca.  She  is  a  part  of  the  sysadmin  and  cars  group  and  has  a

- password ‘test’.

- Line 80: Ensure the user ‘fred’ is present on the system. His uid is 10023011, his shell is /bin/csh and is home

- directory must be managed at /home/fred. He is a part of the trucks, cars and wheel (sudo) groups and has a

- password ‘test’. The user resource for ‘fred’ requires that the augeas ‘etc/shells’ resource has been run.

- Line 92: Ensure the user ‘wilma’ is present on the system. Her uid is 10033011, her home directory is managed

- at /home/Wilma and she is a part of the trucks, cars, and ambulances group. She has a password ‘test’.

- Line 102: Use the ssh_authorized_key resource type to add an ssh key for the user Wilma. This key is of type

- rsa and the key is supplied.

- Line  109:  Using  the  file  resource  type  ensure  that  the  /etc/profile.d/bin.sh  file exists,  this  file’s  owner  and

- group is root and has permissions 0640. The contents of this file exports the environment PATH variable with

- the new directory appended to it.

- PUPPET ENTERPRISE - NOVEMBER 16, 2016

![Image58](images/Image58)

![Image59](images/Image59)

- Ryan Flett

CPT264 Unix Systems Administration Assignment 2 Part 2

16/11/2016- Sshfs_setup.pp

- Line  29:  Store  the  contents  of  the  public  rsa  key  file  generated  on  titan  to  in  a  variable  called

- titan_rsa_id_content.

- Line 32: Store the contents of what will be a script in the titan_script variable. This file’s contents uses sshfs to

- mount the remote titan directory to becca’s home directory. The ssh key will be used to validate the user.

- Line 35: File resource type ensures that ‘/home/becca/.ssh’ exists because this is where the ssh key will be

- placed. This directory has owner and group root and permissions 0640.

- Line 43: Ensure that the file titan_id.pub exists in the above directory. This file has owner and group root and

- permissions  0640.  This  resource  will  not  be  executed  unless  the  file  resource  ‘/home/becca/.ssh’  has  been

- executed.

- Line  52:  Ensure  that  the  directory  where  the  remote  mount  will  occur  exists.  This  directory  is

- /home/becca/titan and has owner and group root and permissions 0640. This directory requires that the home

- directory exists already.

- Line 61: Ensure that the directory /etc/init.d exists and its permissions are 0755 (executable). This is where the

- script will be placed.

- Line 67: Ensure the file /etc/init.d/titan.sh exists and that it’s owner and group are root and permissions 0640.

- This file requires that the /etc/init.d, /home/becca/.ssh/titan_id.pub and ‘/home/becca/titan directories and

- files exists. The contents of titan.sh is the titan_script variable.

- Line 77: Run the exec resource type to ensure that titan.sh script is added to the list of scripts that will run

- during startup. This is done by running the ‘update-rc.d titan.sh defaults 3’ command in the working directory

- /tmp. The paths required for this are /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin. This exec

- will only run when it receives an event as its refresh only is set to true. This exec resource requires that the

- titan.sh script exists.

- PUPPET ENTERPRISE - NOVEMBER 16, 2016

- Ryan Flett

CPT264 Unix Systems Administration Assignment 2 Part 2

16/11/2016- /modules/sysman/manifests/init.pp

- Line  19:  Using  the  host  resource  type,  ensure  the  entry  for  the  ip  131.170.5.131  is  mapped  to

- titan.csit.rmit.edu.au. This entry is called ‘titan’, and as such this ip can be used anywhere by using the ‘titan’

- reference.

- Line  26:  Using  the  host  resource  type,  ensure  the  entry  for  the  ip  131.170.5.132  is  mapped  to

- jupiter.csit.rmit.edu.au. This entry is called ‘jupiter, and as such this ip can be used anywhere by using the ‘jupiter

- reference.

- Line  33:  Using  the  host  resource  type,  ensure  the  entry  for  the  ip  131.170.5.135  is  mapped  to

- saturn.csit.rmit.edu.au. This entry is called ‘saturn, and as such this ip can be used anywhere by using the ‘saturn

- reference.

- /modules/puppetconf/manifests/init.pp

- Line  19:  Using

the  augeas  resource

type  make  changes

to

the  puppet.conf  file

locatedin- /etc/puppetlabs/puppet/ such that the configuration entry ‘runinterval’ is set to 1200 under the ‘agent’ heading.

- PUPPET ENTERPRISE - NOVEMBER 16, 2016

![Image62](images/Image62)

![Image63](images/Image63)

- Ryan Flett

CPT264 Unix Systems Administration Assignment 2 Part 2

16/11/2016- /modules/packages/manifests/

- Init.pp

- Line 15: Define empty class packages. Sub classes are derived from this.

- Dia2code.pp

- Line 28: Store the URL to the dia2code RPM file in the rpm_url variable

- Line 29: Store the package dependencies for dia2code in an array called dependencies.

- Line 32: Use the package resource type to install the packages stored in the dependencies array.

- Line 27: Ensure the dia2code package is installed from the RPM provider. The RPM URL is provided with the

- rpm_url variable and this package requires the dependencies package has been installed.

- Emacs.pp

- Line 18: Using the package resource type ensure that the emacs package is present on the system.

- Gcc.pp

- Line 18: Using the package resource type ensure that the gcc package is present on the system.

- PUPPET ENTERPRISE - NOVEMBER 16, 2016

![Image65](images/Image65)

![Image66](images/Image66)

![Image67](images/Image67)

- Ryan Flett

- Httpd.pp

CPT264 Unix Systems Administration Assignment 2 Part 2

16/11/2016- Line 18: Ensure the httpd package is present

- Line 23: Ensure the file /etc/httpd/conf exists and is a directory with owner and group root and permission

- 0640. This directory requires that the httpd package has been installed.

- Line 32: Ensure the httpd.conf file exists in the above directory and has owner and group root and permissions

- 0640. This File requires that the httpd package exists.

- Line 41: Ensure that the document root directory exists with owner and group root and permissions 0640. This

- file requires that the httpd package is installed.

- Line 50: Ensure the httpd service is running and will start on boot. This service is subscribed to the http.conf

- file so will restart when changes are made to this file.

- Line  57:  Use  augeas  to  edit  the  httpd.conf  file.  The  changes  are  made  to  the  document  root  directive  and

- directory in the httpd.conf file. This resource depends on the config file and the document root directory to

- exist.

- Gdb.pp

- Line 18: Using the package resource type ensure that the gdb package is present on the system.

- Lynx.pp

- Line 18: Using the package resource type ensure that the lynx package is present on the system.

- PUPPET ENTERPRISE - NOVEMBER 16, 2016

![Image69](images/Image69)

![Image70](images/Image70)

![Image71](images/Image71)

- Ryan Flett

- Mysql.pp

CPT264 Unix Systems Administration Assignment 2 Part 2

16/11/2016- Line 18: Ensure the mysql package is present on the system.

- Line 23: Ensure the file /etc/mysql exists and is a directory with owner and group root and permissions 0640.

- This file requires that the mysql package is present.

- Line 32: Ensure that the my.cnf file exists which is the configuration file for my mysql. This file must have

- owner and group root and permissions 0640. This file requires that the mysql package is present.

- Openssh.pp

- Line 18: Ensure the openssl-libs package is installed. The openssh package is dependent on this being installed.

- Line 23: Ensure the openssh package is present. This package requires that the openssl-libs package is present

- to run.

- Line 29: Ensure the openssh-server package is present on the system. This package is dependent on the openssh

- package being present.

- Line 35: Ensure the /etc/ssh/ directory exists with owner and group root and 0640 permissions. This directory

- requires that the ssh-server package is present.

- Line  44:  Ensure  that  the  sshd_config  file  exists  in  the  /etc/ssh  directory  with  owner  and  group  root  and

- permissions 0640. This file requires that the openssh-server package is installed.

- Line 53: Ensure the sshd service is running and that it will run on boot. The sshd service is subscribed to the

- sshd_config file so that if changes are made the service will restart.

- Line 60: Use augeas to edit the sshd config file to disable root logins. This resource requires that the sshd_config

- file exists.

- PUPPET ENTERPRISE - NOVEMBER 16, 2016

![Image73](images/Image73)

![Image74](images/Image74)

![Image75](images/Image75)

- Ryan Flett

- Tmux.pp

CPT264 Unix Systems Administration Assignment 2 Part 2

16/11/2016- Line 18: Ensure the ncurses-devel package is installed.

- Line 23: Ensure the glibc-static package is installed.

- Line 28: Install the tmux package. This package requires that the ncurses-devel and glibc-static packages are

- already present to run.

- Sshfs.pp

- Line 18: Store the dependencies for fuse-sshfs in an array called dependencies.

- Line 21: Install the dependencies in the dependencies array.

- Line 26: Ensure the fuse-sshfs package is present. This package is installed with the RPM provider from the

- URL supplied in the source parameter. This package requires that the fuse-libs package is installed to continue.

- PUPPET ENTERPRISE - NOVEMBER 16, 2016

![Image77](images/Image77)

![Image78](images/Image78)

- Ryan Flett

- Vim.pp

CPT264 Unix Systems Administration Assignment 2 Part 2

16/11/2016- Line 18: Ensure the vim package is present on the system.

- PUPPET ENTERPRISE - NOVEMBER 16, 2016

![Image80](images/Image80)

- Ryan Flett

CPT264 Unix Systems Administration Assignment 2 Part 2

16/11/2016- Amazon Web Services

- Secure installation

- Only ports 80 (HTTP), 443 (HTTPS), 22 (SSH) and 3000 (Puppet) through the TCP protocol are allowed

- through the firewall to my external IP.

- Puppet running

- PUPPET ENTERPRISE - NOVEMBER 16, 2016

![Image82](images/Image82)

![Image83](images/Image83)

- Ryan Flett

CPT264 Unix Systems Administration Assignment 2 Part 2

16/11/2016- Successful puppet agent run

- PUPPET ENTERPRISE - NOVEMBER 16, 2016

![Image85](images/Image85)

![Image86](images/Image86)

![Image87](images/Image87)

