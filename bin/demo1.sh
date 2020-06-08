java -jar POCDriver.jar -t 2 -d 60 -i 100 -b 1 -n POCDB.test -e -s 100 -c "mongodb://admin:welcomemongo@mongo01,mongo02,mongo03/?replicaSet=myRepl"
sleep 10
java -jar POCDriver.jar -t 2 -d 60 -i 0 -u 100 -b 1 -n POCDB.test -s 100 -c "mongodb://admin:welcomemongo@mongo01,mongo02,mongo03/?replicaSet=myRepl"
sleep 10
java -jar POCDriver.jar -t 2 -d 60 -i 100 -u 0 -b 100 -n POCDB.test -s 100 -e -c "mongodb://admin:welcomemongo@mongo01,mongo02,mongo03/?replicaSet=myRepl"
sleep 10
java -jar POCDriver.jar -t 2 -d 60 -i 0 -u 100 -b 1 -n POCDB.test -s 100 -c "mongodb://admin:welcomemongo@mongo01,mongo02,mongo03/?replicaSet=myRepl"
