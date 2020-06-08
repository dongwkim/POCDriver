#!/usr/bin/python
import os
import re
import sys

trial = sys.argv[1]
binary = sys.argv[2]
proc = sys.argv[3]
dir = binary + '_' + trial + '_trial_'+ proc + 'p'
arr = os.listdir('./' + dir)
#print(arr)
filelist = []
cnt = 0
lat1m = 0
lat2m = 0
l_lat1m = 0
l_lat2m = 0
for file in arr:
    skip = 0
    l_cnt = 0
    if re.match(trial + '_[0-9].*' + binary + '.out',file):
        filelist.append(file)
        with open('./' + dir + '/' +file) as f:
            lines = reversed(f.readlines())
            for line in lines:
                l_lat1m = l_lat1m + float(line.split(',')[14])
                l_lat2m = l_lat2m + float(line.split(',')[15])
                cnt = cnt + 1
                l_cnt = l_cnt + 1
                skip = skip + 1
                if ( skip >= 60 ):
                    lat1m = lat1m + l_lat1m
                    lat2m = lat2m + l_lat2m
                    print("{:15s} | Avg Latency for {} trial {} is | 1ms: {:3.1f}, 2ms: {:3.1f}".format(file,trial ,binary, l_lat1m/l_cnt, l_lat2m/l_cnt ))
                    l_lat1m = 0
                    l_lat2m = 0
                    break
                #print("lat1m:{}, lat2m:{}".format(lat1m,lat2m))
print(filelist)
print("Avg of Avg Latency for {} trial {} is | 1ms: {:3.1f}, 2ms: {:3.1f}".format(trial ,binary, lat1m/cnt, lat2m/cnt ))


