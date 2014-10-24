FROM ubuntu:12.04
MAINTAINER taoruifu "truifu@gmail.com"
RUN sed -i "s/archive.ubuntu.com/mirrors.163.com/g" /etc/apt/sources.list
RUN mkdir /opt/dependency
RUN mkdir /opt/config
ADD ./dependency/redis-2.8.17.tar.gz /opt/dependency
WORKDIR /opt/dependency/redis-2.8.17
RUN make && make install
RUN ldconfig

EXPOSE 22 6379
ENTRYPOINT /etc/init.d/ssh restart && /opt/redis/start.sh && tail -f /etc/hosts 
CMD []
