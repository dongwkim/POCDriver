for i in `seq 1 1`
do
sleep 10
#$1: Duration seconds
#$2: Sleep
#sh run.sh collections binsize seconds log_postfix process# log_prefix
#sh run.sh usdf30k_4p_8t 26 $1 30k 3 $i
#sleep $2 
#sh run.sh usdf30k_6p_12t 26 $1 20k 5 $i
#sleep $2
#sh run.sh usdf30k_8p_16t 26 $1 10k 7 $i
#sleep $2
## Set2
#sh run.sh usdf20k_8p_16t 16 $1 30k 7 $i
#sleep $2 
#sh run.sh usdf20k_10p_20t 16 $1 20k 9 $i
#sleep $2
#sh run.sh usdf20k_12p_24t 16 $1 10k 11 $i
#sleep $2
## Set3
#sh run.sh usdf10k_10p_20t 6 $1 30k 9 $i
#sleep $2 
#sh run.sh usdf10k_12p_24t 6 $1 20k 11 $i
#sleep $2
#sh run.sh usdf10k_14p_28t 6 $1 10k 13 $i
#sleep $2
sh run.sh usdf30k_8p_16t 26 $1 30k 7 $i
sleep $2
sh run.sh usdf30k_12p_24t 26 $1 30k 11 $i
done
