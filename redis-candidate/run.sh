HOME=`pwd`
NUM=3
SSH_PORT_START=2305
REDIS_PORT_START=6100
MASTERIP="10.2.117.185"
MASTER_PORT_START=6000
for((i=1;i<=$NUM;i++))
do
   SSHP=$(expr $SSH_PORT_START + $i) 
   REDISP=$(expr $REDIS_PORT_START + $i)
   MASTERPORT=$(expr $MASTER_PORT_START + $i)
   
   docker run -d -p $SSHP:22 -p $REDISP:6379 -e REDISNO="$i" -e MASTERIP="$MASTERIP" -e MASTERPORT="$MASTERPORT" -v $HOME/config:/opt/config -v $HOME/redis:/opt/redis redis-candidate:1024
done
