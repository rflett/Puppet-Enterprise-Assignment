# packages

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup - The basics of getting started with packages](#setup)
    * [What packages affects](#what-packages-affects)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
## Overview

Package installation and configuration.

## Module Description

This module installs several packages and their dependencies, as well as creating and
configuring the configuration files for these packages. Where applicable, the class will
start the service for that package and ensure it runs on boot.

## Setup

### What packages affects

* Apache
* dia2code
* emacs
* gcc
* gdb
* lynx
* MySQL Server and Client
* openssh
* sshfs
* tmux
* vim, and
* vncserver

## Reference

Classes:
* packages
* packages::openssh
* packages::httpd
* packages::emacs
* packages::gcc
* packages::gdb
* packages::mysql
* packages::sshfs
* packages::vim
* packages::vncserver
* packages::tmux
* packages::dia2code
* packages::lynx

Types:
* Package
* File
* Service
* Augeas

Providers:
* yum
* rpm

## Limitations

RHEL
