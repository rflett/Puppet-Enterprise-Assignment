# userman

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What userman affects](#what-userman-affects)
4. [Reference](#reference)
5. [Limitations](#limitations)

## Overview

Adds and configures users on the system.

## Module Description

Adds three users becca, fred and wilma to the system and assigns them to appropriate groups
and configures default shell access. Passwords and ssh keys are provided.
The sshfs_setup class mounts the RMIT titan server on boot to becca's home directory using sshfs.

## Setup

### What userman affects

The userman class creates user home directories and adds a script to /etc/profile.d/
The userman::sshfs class creates a script to mount the titan remote directory to a folder in
becca's home. 

## Reference

Classes:
* userman
* userman::sshfs_setup

Resource types:
* file
* group
* user
* ssh_authorized_key
* exec

Variables
* titan_rsa_id_content
* titan_script

The exec resource type adds the script which mounts the titan directory to the start up sequence using
the update-rc.d command.


## Limitations

RHEL
