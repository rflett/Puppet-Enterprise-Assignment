# Unix Systems Administration Assignment 2

The purpose of this assignment was to practice implementing infrastructure as code using Puppet Enterprise.

There are four modules under /modules/, these are:
* Packages
* Userman
* Sysman
* Puppetconf

The packages modules ensures that packages are installed on the system. 
The userman modules covers user management which involves ensuring certain users exist and specifying configuration for those users. 
The system management module 'sysman' adds entries to the /etc/hosts file to make connecting to RMIT's core teaching servers easier by specifying an alias instead of an IP or domain. 
Finally the puppetconf module manages puppet agent configuration. For this assignment it just changes the run interval of the puppet agent to check in every 20 minutes instead of the default 30.
