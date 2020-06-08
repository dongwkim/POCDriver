#!/usr/bin/python
import os
import re
import sys

trial = sys.argv[1]
binary = sys.argv[2]
proc = sys.argv[3]

tps = 0
cnt = 0 
l_tps = 0
l_cnt = 0
dir = binary + '_' + trial + '_trial_'+ proc + 'p'
arr = os.listdir('./' + dir)
filelist = []
for file in arr:
    skip = 0
    if re.match(trial + '_[0-9].*' + binary + '.log',file):
        filelist.append(file)
        with open('./' + dir + '/' +file) as f:
            lines = reversed(f.readlines())
            for line in lines:
                if 'updates per second since last report' in line:
                    l_tps = l_tps + int(line.split()[0].replace(',',''))
                    cnt = cnt + 1
                    l_cnt = l_cnt + 1
                    skip = skip + 1
                    if ( skip > 30):
                        print("{:15s} | Avg Update TPS for {} trial {} is | {:3.1f}".format(file,trial ,binary, l_tps/l_cnt))
                        tps = tps + l_tps/l_cnt
                        l_cnt = 0
                        l_tps = 0

                        break

                    #print("accum:{}".format(tps))
print(sorted(filelist))
print("Sum of Avg TPS for {} trial {} is :  {}".format(trial ,binary, tps))

