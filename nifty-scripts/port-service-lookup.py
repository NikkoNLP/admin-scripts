#!/bin/python
# Author: Nikko Pedersen
# Revised: 12/17/2017
# Purpose: Looks up the service correlated with a port
# Execute: python port-service-lookup.py <port>
# Set Bash alias: alias ports='python /path/to/port-service-lookup.py'
# ---------------------------------------
### Imports
from socket import getservbyport
from sys import argv

### Take first argument passed as port
port = argv[1] 

print getservbyport(int(port))

