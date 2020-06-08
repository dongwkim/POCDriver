#java -jar ../bin/POCDriver.jar -u 100 -n POCDB.secnet30k --updatefields 26 --binary 26 -i 0 -t $1 -c "mongodb+srv://secuser:welcomemongo@udsf-nn9cc.mongodb.net/test?minPoolSize=128&maxPoolSize=256" -s 1
#java -jar ../bin/POCDriver.jar -u 100 -n POCDB.secnet30k --updatefields 26 --binary 26 -i 0 -t $1 -c  "mongodb://secuser:welcomemongo@mongoperf/?authSource=admin&minPoolSize=128&maxPoolSize=256"
logdir=${4}_${6}_trial_${5}p
mkdir $logdir
for i in `seq 0 $5`
do
t=$((i*2))
java -jar ../bin/POCDriver.jar -n POCDB.${1} -u 100 -t 2 --binary $2 -c "mongodb://secuser:welcomemongo@mongoperf/?authSource=admin&minPoolSize=2" --updatefields 25 -b 1 --threadIdStart $t -s 1,2 -i 0 -d $3 -o ./$logdir/${6}_${i}_${4}.out  > ./$logdir/${6}_${i}_trial_${4}.log &
sleep 1
done
wait
