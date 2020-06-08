#java -jar ../bin/POCDriver.jar --binary 16 -e -n POCDB.secnet20k -i 100 -t 24 --binary 16 -c "mongodb+srv://secuser:welcomemongo@udsf-nn9cc.mongodb.net/test"
for i in `seq 0 $3`
do
t=$((i*2))
java -jar ../bin/POCDriver.jar -n POCDB.${1} -i 100 -u 0 -t 2 --binary $2 -c "mongodb://secuser:welcomemongo@mongoperf/?authSource=admin" -b 1 --threadIdStart $t &
done
wait
