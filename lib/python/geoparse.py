#!/usr/bin/env python

import re
import argparse

parser = argparse.ArgumentParser(description='Geo Parse')
parser.add_argument('url', nargs='?', help='A URL with lat/lon coordinates')
args = parser.parse_args()

if args.url is not None and args.url:
    latlongroup = re.search(r'([0-9\.-]+),\s?([0-9\.-]+)', args.url)

    if latlongroup:
        print str(latlongroup.group(1)) + ',' + str(latlongroup.group(2))
else:
	print "No URL supplied - exiting"

