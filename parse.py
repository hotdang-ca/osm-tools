#!/usr/bin/python

# Parses PBF->OSM extracted data for key/value pairs including lat/lon
# (c) 2017, James Robert Perih

import sys
import os
import xml.etree.ElementTree
import requests
import time
import json

url = "http://sample-env-2.diiqepxzgm.us-east-1.elasticbeanstalk.com/dynamodb-geo"
file_name = None
place_filter = None


def send_point(name, lat, lng):
    print "Sending data %s, %s, %s" % (name, lat, lng)
    data = {
        'action': 'put-point',
	    'request': {
            'lat': lat,
            'lng': lng,
            'locationName': name
        }
	}

    r = requests.post(url, json=data)
    print r.headers
    print ( "Response is %s, %s" % (r.status_code, r.text) )
    # time.sleep(1)

    return

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
                    send_point(name, lat, lng)
                    # print("%s,%s,%s" % (name, lat, lng) )
            else:
                send_point(name, lat, lng)
                # print("%s,%s,%s" % (name, lat, lng) )

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

                    send_point(thisWayName, lat, lng)
                    # print( "%s,%s,%s" % (thisWayName,lat, lng) )
            else:
                # Get all reference nodes coordinates
                for node in e.findall('node'):
                    if node.get('id') == thisWayNodeList[0]:
                        lat = node.get('lat')
                        lng = node.get('lon')

                send_point(thisWayName, lat, lng)
                # print( "%s,%s,%s" % (thisWayName,lat, lng) )
