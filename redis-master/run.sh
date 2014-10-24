HOME=`pwd`
NUM=3
SSH_PORT_START=2205
REDIS_PORT_START=6000
for((i=1;i<=$NUM;i++))
do
   SSHP=$(expr $SSH_PORT_START + $i) 
   REDISP=$(expr $REDIS_PORT_START + $i)
   docker run -d -p $SSHP:22 -p $REDISP:6379 -e REDISNO="$i" -v $HOME/config:/opt/config  redis-master:1024
done
