#!/usr/bin/env python

import argparse
import os
import random

parser = argparse.ArgumentParser(description='Geo GPX')
parser.add_argument('-i', '--input-file', action='store', dest='input_file', help='A file to read data from')
parser.add_argument('-o', '--output-file', action='store', dest='output_file', help='A file to write the data to')
args = parser.parse_args()

if args.input_file is None:
    exit(1);

if args.output_file is None:
    exit(1);

with open(args.output_file, 'w') as output_file:
    wp_count = 1
    output_file.write('<?xml version="1.0" encoding="UTF-8" standalone="no" ?>' + os.linesep)
    output_file.write('<gpx version="1.1" creator="geogpx" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.topografix.com/GPX/1/1" xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd">' + os.linesep)

    with open(args.input_file, 'r') as input_file:
        lines = input_file.readlines()

        for line in lines:
            if line.strip() is not None:
                lat = line.strip().split(',')[0].strip()
                lon = line.strip().split(',')[1].strip()
                output_file.write('<wpt lat="' + lat + '" lon="' + lon + '">' + os.linesep)
                output_file.write('<ele>' + str(round(random.uniform(100.0, 200.0), 2)) + '</ele>' + os.linesep)
                output_file.write('<name>WP' + str(wp_count) + '</name>' + os.linesep)
                output_file.write('</wpt>' + os.linesep)
                wp_count = wp_count + 1

    output_file.write('</gpx>')
