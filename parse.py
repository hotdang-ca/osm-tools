#!/usr/bin/python

# Parses PBF->OSM extracted data for key/value pairs including lat/lon
# (c) 2017, James Robert Perih

import sys
import os
import xml.etree.ElementTree

file_name = None
place_filter = None

if len(sys.argv) == 1:
    print "Not enough arguments. Specify the filename, and optional filter."
    print ""
    print "Usage: parse.py <filename> \"[filter]\""
    os._exit(1)

if len(sys.argv) > 1:
    file_name = sys.argv[1]

if len(sys.argv) > 2:
    place_filter = sys.argv[2]

e = xml.etree.ElementTree.parse(file_name).getroot()

for node in e.findall('node'):
    lat = node.get('lat')
    lng = node.get('lon')

    for nameNode in node.iter('tag'):
        if nameNode.get('k') == 'name':
            name = nameNode.get('v')

            if place_filter != None:
                if place_filter == name:
                    print("%s,%s" % (lat, lng) )
            else:
                print("%s,%s)" % (lat, lng) )

for way in e.findall('way'):
    thisWayNodeList = []
    thisWayName = ''
    lat = ''
    lng = ''

    # Enumerate all Reference Nodes
    for nodeRef in way.iter('nd'):
        thisWayNodeList.append(nodeRef.get('ref'))

    # Get all nodes with name
    for nameNode in way.iter('tag'):
        if nameNode.get('k') == 'name':
            thisWayName = nameNode.get('v')

            if place_filter != None:
                if place_filter == thisWayName:
                    # Get all reference nodes coordinates
                    for node in e.findall('node'):
                        if node.get('id') == thisWayNodeList[0]:
                            lat = node.get('lat')
                            lng = node.get('lon')

                    print( "%s,%s" % (lat, lng) )
            else:
                # Get all reference nodes coordinates
                for node in e.findall('node'):
                    if node.get('id') == thisWayNodeList[0]:
                        lat = node.get('lat')
                        lng = node.get('lon')

                print( "%s,%s" % (lat, lng) )
