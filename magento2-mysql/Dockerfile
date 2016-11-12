FROM ubuntu:16.04

MAINTAINER Nilesh A. <nilesh@krishtechnolabs.com>

RUN groupadd -r mysql && useradd -r -g mysql mysql
RUN apt-get update && apt-get install -y mysql-server-5.7 apg

RUN sed -E -i -e 's/= 127.0.0.1/= 0.0.0.0/g' -e 's/^(\[mysqld\])/\1\ninnodb_use_native_aio=0/' /etc/mysql/my.cnf

WORKDIR /usr/local/mysql
VOLUME /var/lib/mysql

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 3306

CMD ["mysqld", "--datadir=/var/lib/mysql", "--user=mysql"]
