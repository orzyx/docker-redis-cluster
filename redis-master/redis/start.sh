no=$REDISNO
target=/opt/redis/config/redis$REDISNO.conf
cp /opt/config/redis.conf $target
echo "pidfile /opt/redis/pid/redis$no.pid" >> $target
echo "logfile /opt/redis/logs/redis$no.log" >> $target
echo "dbfilename dump$no.rdb" >> $target

redis-server /opt/redis/config/redis$no.conf
