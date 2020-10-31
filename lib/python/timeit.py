#!/usr/bin/env python

import datetime
import random
import argparse

def default_input(message, default_value):
    if default_value:
        return raw_input("%s [%s]: " % (message,default_value)) or default_value
    else:
        return raw_input("%s " % (message))

parser = argparse.ArgumentParser(description='Time After Time')
parser.add_argument('file', nargs='?', help='An input file for quick usage')
parser.add_argument('-l', '--lower', action='store', dest='lower_time', help='The smallest time variation (in seconds)')
parser.add_argument('-u', '--upper', action='store', dest='upper_time', help='The greatest time variation (in seconds)')
parser.add_argument('-i', '--input', action='store', dest='input_file', help='The file without time')
parser.add_argument('-o', '--output', action='store', dest='output_file', help='The new file with time')
args = parser.parse_args()

if not args.lower_time:
	args.lower_time = default_input("Enter the lower time:", 5)

if not args.upper_time:
	args.upper_time = default_input("Enter the upper time:", 5)

if args.file:
	args.input_file = args.file

if not args.output_file:
	args.output_file = args.input_file

if args.lower_time is not None and args.upper_time is not None and args.input_file is not None and args.output_file is not None and args.lower_time and args.upper_time and args.input_file and args.output_file:
    start_time = datetime.datetime(100,1,1,0,0,0)
    new_file_contents = ''

    with open(str(args.input_file)) as f:
        for line in f:
            line = line.strip()

            if "</name>" in line:
                if "<name>" in line:
                    line = '\t\t' + line

                new_file_contents = new_file_contents + line.rstrip(' \t\r\n\0') + '\n'
                new_file_contents = new_file_contents + "\t\t<time>2200-01-01T" + str(start_time.time()) + "Z</time>\n"
                start_time = start_time + datetime.timedelta(seconds=random.randint(int(args.lower_time),int(args.upper_time)))
            else:
                if "<name>" in line or "<ele>" in line:
                    line = '\t\t' + line

                if "<wpt" in line or "</wpt>" in line:
                    line = '\t' + line

                if "<time>" not in line:
                    new_file_contents = new_file_contents + line.rstrip(' \t\r\n\0') + '\n'

    ofile = open(str(args.output_file), 'w')
    ofile.write(new_file_contents)
    ofile.close()
else:
    print "Not enough arguments supplied - exiting"

