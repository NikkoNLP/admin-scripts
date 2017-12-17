#!/bin/python
# Author: Nikko Pedersen
# Revised: 12/17/2017
# Purpose: Looks up the service correlated with a port
# Execute: python port-service-lookup.py
# Set Bash alias: alias ports='python /home/git/admin-scripts/nifty-scripts/port-service-lookup.py'
# ---------------------------------------
### Imports
from socket import getservbyport
from sys import argv

### Take first argument passed as port
port = argv[1] 

print getservbyport(int(port))

