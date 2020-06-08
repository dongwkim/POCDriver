import csv

for row in csv.reader(10_10k.out):
   rowtotal = 0
   for column in row[15]:
       rowtotal += float(column)
    print(row[0], rowtotal)  
