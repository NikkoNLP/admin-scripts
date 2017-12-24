#!/bin/python
# Author: Nikko Pedersen
# Revised: 12/17/2017
# Purpose: Prints the Geo Location of an IP passed
# Execute: python geoip.py <ip>
# Set Bash alias: alias geoip='python /path/to/geoip.py'
# ---------------------------------------
### Imports
from sys import argv
from geoip import geolite2

### Take first argument passed as IP
ip = argv[1]

### Lookup geolocation of IP
geoip = geolite2.lookup(ip)

### If the IP has an associated state - define state
if str(geoip.subdivisions)[12:14].isalpha():
	state = ", " + str(geoip.subdivisions)[12:14]
else:
	state = ""

### Print details
print ip + ": " + str(geoip.country) + state
