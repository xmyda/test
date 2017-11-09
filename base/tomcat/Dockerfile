FROM 172.18.1.111/base/jdk:alpine

MAINTAINER mingyan_xiong@163.com
 

RUN apk add --no-cache wget bash tzdata gcc g++ make apr apr-dev \
    && mkdir -p /data \
    && wget -q -O - http://mirror.bit.edu.cn/apache/tomcat/tomcat-7/v7.0.82/bin/apache-tomcat-7.0.82.tar.gz | tar -xzvf - -C /data \
    && mv /data/apache-tomcat-* /data/tomcat \
    && cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV TOMCAT_HOME=/data/tomcat
ENV JAVA_MEM_OPTS="-Xms2g -Xmx2g -Xmn768m -Xss256k -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m"

ADD cronolog-1.6.2.tar.gz /tmp/

RUN cd /tmp/cronolog-1.6.2 \
    && ./configure \
    && make \
    && make install \
    && rm -rf /tmp/cronolog-1.6.2 \
    && cd /data/tomcat/bin/ \
    && tar zxvf tomcat-native.tar.gz \
    && cd tomcat-native-*/native/ \
    && find / -name apr* \
    && ./configure --with-apr=/usr/bin/apr-1-config \
    && make \
    && make install

RUN rm -rf /data/tomcat/conf/server.xml \
    && rm -rf /data/tomcat/bin/catalina.sh

ADD conf/catalina.sh /data/tomcat/bin/
ADD conf/server.xml /data/tomcat/conf/
RUN chmod +x /data/tomcat/bin/catalina.sh \
    && mkdir -p /data/webapp/ROOT

WORKDIR /data/tomcat

COPY ./docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

EXPOSE 8080

CMD ["/docker-entrypoint.sh"]  
