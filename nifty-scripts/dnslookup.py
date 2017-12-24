#!/bin/python
# Author: Nikko Pedersen
# Revised: 12/17/2017
# Purpose: Provides DNS for domain passed
# Execute: python dnslookup.py <domain.com>
# Set Bash alias: alias dns='python /path/to/dnslookup.py'
# ---------------------------------------
### Imports
import dns.resolver
from sys import argv

### Take the first argument passed to the script and define as domain 
domain = argv[1]

### Define the Records for the domain
myResolver = dns.resolver.Resolver()

### Print Records
## A Record
print "A Record: " + domain
try:
	aRecord = myResolver.query(domain, "A")
	for record in aRecord:
	        print record

except:
	print "None"

## MX Record
print ""
print "MX Record: " + domain
try:
	mxRecord = myResolver.query(domain, "MX")
	for record in mxRecord:
	        print record
except:
	print "None"

## NS Record
print ""
print "Name Servers: " + domain
try:
	nsRecord = myResolver.query(domain, "NS")
	for record in nsRecord:
	        print record

except:
	print "None"

## SPF Record
print ""
print "SPF Record: " + domain
try:
	spfRecord = myResolver.query(domain, "SPF")
	for record in spfRecord:
        	print record
except:
	print "None"


## TXT Record
print ""
print "TXT Record: " + domain
try:
	txtRecord = myResolver.query(domain, "TXT")
	for record in txtRecord:
	        print record
except:
	print "None"

## PTR Record
print ""
print "PTR Record: " + domain
try:
	ptrRecord = myResolver.query(domain, "PTR")
	for record in ptrRecord:
	        print record
except:
	print "None"

print ""
