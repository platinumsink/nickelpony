#!/usr/bin/env python

import math
import argparse

parser = argparse.ArgumentParser(description='Geo Bloom')
parser.add_argument('coordinates', nargs='?', help='A comma separated lat,long pair')
parser.add_argument('-l', '--length', action='store', dest='input_length', help='A length, in feet, from the starting point')
parser.add_argument('-n', '--number', action='store', dest='input_number', help='The number of points to bloom')
parser.add_argument('-lat', '--latitude', action='store', dest='input_lat', help='The latitude of the starting point')
parser.add_argument('-lon', '--longitude', action='store', dest='input_lon', help='The longitude of the starting point')
args = parser.parse_args()

def vincenty_distance(lat1, lon1, lat2, lon2, us, meters_only):
    if math.fabs(lat1) > 90 or math.fabs(lon1) > 180 or math.fabs(lat2) > 90 or math.fabs(lon2) > 180:
        return 0

	if lat1 == lat2 and lon1 == lon2:
	    return 0

	lat1 = math.radians(lat1)
	lon1 = math.radians(lon1)
	lat2 = math.radians(lat2)
	lon2 = math.radians(lon2)

	a = 6378137
	b = 6356752.3142
	f = 1 / 298.257223563

	L = lon2 - lon1
	U1 = math.atan((1 - f) * math.tan(lat1))
	U2 = math.atan((1 - f) * math.tan(lat2))
	sinU1 = math.sin(U1)
	cosU1 = math.cos(U1)
	sinU2 = math.sin(U2)
	cosU2 = math.cos(U2)
	lambdaL = L
	lambdaP = 2 * math.pi
	iterLimit = 50

	while math.fabs(lambdaL - lambdaP) > math.expml(1e-12) and iterLimit > 0:
		sinLambda = math.sin(lambdaL)
		cosLambda = math.cos(lambdaL)
		sinSigma = math.sqrt((cosU2 * sinLambda) * (cosU2 * sinLambda) + (cosU1 * sinU2 - sinU1 * cosU2 * cosLambda) * (cosU1 * sinU2 - sinU1 * cosU2 * cosLambda))
		cosSigma = sinU1 * sinU2 + cosU1 * cosU2 * cosLambda
		sigma = math.atan2(sinSigma, cosSigma)
		alpha = math.asin(cosU1 * cosU2 * sinLambda / sinSigma)
		cosSqAlpha = math.cos(alpha) * math.cos(alpha)
		cos2SigmaM = 0

		if cosSqAlpha == 0:
		    cosSigma = 0
		else:
		    cosSigma = cosSigma - 2 * sinU1 * sinU2 / cosSqAlpha

		C = f / 16 * cosSqAlpha * (4 + f * (4 - 3 * cosSqAlpha))
		lambdaP = lambdaL;
		lambdaL = L + (1 - C) * f * math.sin(alpha) * (sigma + C * sinSigma * (cos2SigmaM + C * cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM)))

		iterLimit = iterLimit - 1

	if iterLimit == 0:
	    return 0

	uSq = cosSqAlpha * (a * a - b * b) / (b * b)
	A = 1 + uSq / 16384 * (4096 + uSq * (-768 + uSq * (320 - 175 * uSq)))
	B = uSq / 1024 * (256 + uSq * (-128 + uSq * (74 - 47 * uSq)))
	deltaSigma = B * sinSigma * (cos2SigmaM + B / 4 * (cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM) - B / 6 * cos2SigmaM * (-3 + 4 * sinSigma * sinSigma) * (-3 + 4 *cos2SigmaM * cos2SigmaM)))
	s = b * A * (sigma - deltaSigma)

	return s

# Using meters mostly
def point_at_distance_and_bearing(start_lat, start_lon, distance, bearing):
    earth_radius = 6378137
    start_lat_rad = math.radians(start_lat)
    start_lon_rad = math.radians(start_lon)
    distance = distance * 0.3048

    if math.fabs(bearing) >= 360:
        bearing = bearing % 360

    if bearing < 0:
        bearing = bearing + 360

    isig = 0

    if bearing <= 180:
        isig = 1

    a = 360 - bearing

    a = math.radians(a)

    bb = (math.pi / 2) - start_lat_rad
    cc = distance / earth_radius

    sin_bb = math.sin(bb)
    cos_bb = math.cos(bb)
    cos_cc = math.cos(cc)

    cos_aa = cos_bb * cos_cc + (sin_bb * math.sin(cc) * math.cos(a))

    if cos_aa <= -1:
        cos_aa = -1

    if cos_aa >= 1:
        cos_aa = 1

    aa = 0

    if round(cos_aa, 15) == 1:
        aa = 0
    else:
        aa = math.acos(cos_aa)

    cos_c = (cos_cc - (cos_aa * cos_bb)) / (math.sin(aa) * sin_bb)

    if cos_c <= -1:
        cos_c = -1

    if cos_c >= 1:
        cos_c = 1

    c = 0

    if round(cos_c, 15) == 1:
        c = 0
    else:
        c = math.acos(cos_c)

    end_lat_rad = (math.pi / 2) - aa
    end_lon_rad = start_lon_rad - c

    if isig == 1:
        end_lon_rad = start_lon_rad + c

    if end_lon_rad > math.pi:
        end_lon_rad = end_lon_rad - (2 * math.pi)

    if end_lon_rad < (0 - math.pi):
        end_lon_rad = end_lon_rad + (2 * math.pi)

    ending_point = [math.degrees(end_lat_rad), math.degrees(end_lon_rad)]

    for i in range(5):
        vincenty = vincenty_distance(start_lat, start_lon, ending_point[0], ending_point[1], False, True)

        if math.fabs(start_lon - ending_point[1]) > 180:
            variable_for_the_sake_of_variable = True
        else:
            error = 0
            if vincenty is not None:
                error = distance / vincenty
            else:
                error = 1

            dlat = ending_point[0] - start_lat
            dlon = ending_point[1] - start_lon
            ending_point[0] = start_lat + (dlat * error)
            ending_point[1] = start_lon + (dlon * error)

    return ending_point

if args.input_length is None:
    args.input_length = 10

if args.input_number is None:
    args.input_number = 8

if args.coordinates is not None:
    args.input_lat = args.coordinates.strip().split(',')[0]
    args.input_lon = args.coordinates.strip().split(',')[1]
    degree = float(360) / float(args.input_number)

    for i in range(int(args.input_number)):
        distance_point = point_at_distance_and_bearing(float(args.input_lat), float(args.input_lon), float(args.input_length), i * degree)
        print str(distance_point[0]) + ',' + str(distance_point[1])
