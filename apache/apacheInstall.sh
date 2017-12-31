#!/bin/bash
## Updated: 12/30/2017
## Purpose: Install Apache
##---------------------------------------
### Import apacheFunctions
source apacheFunctions

### Install Apache
configureRepos
installApache
enableApache
enableApacheSsl
openFirewallApache
