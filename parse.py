#!/usr/bin/python

# Parses PBF->OSM extracted data for key/value pairs including lat/lon
# (c) 2017, James Robert Perih

import sys
import os
import xml.etree.ElementTree

if len(sys.argv) < 1:
    print "Not enough arguments. Specify the filename."
    os._exit(1)

filename = sys.argv[1]

e = xml.etree.ElementTree.parse(filename).getroot()

for node in e.findall('node'):
    lat = node.get('lat')
    lng = node.get('lon')

    for nameNode in node.iter('tag'):
        if nameNode.get('k') == 'name':
            name = nameNode.get('v')
            print("NODE: %s (%s, %s)" % (name, lat, lng) )

for way in e.findall('way'):
    lat = way.get('lat')
    lng = way.get('lon')

    # print ("%s %s" % (lat, lng))

    for nameNode in way.iter('tag'):
        if nameNode.get('k') == 'name':
            name = nameNode.get('v')
            print("WAY: %s (%s, %s)" % (name, lat, lng) )
