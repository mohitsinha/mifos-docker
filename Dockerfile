FROM tomcat:jre8

ADD ./server.xml /usr/local/tomcat/conf/server.xml

ADD ./fineract-provider.war /usr/local/tomcat/webapps/fineract-provider.war

ADD ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh


RUN apt-get update \
	&& apt-get install -y mysql-client \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /run/mysqld \
	&& chown 999 /run/mysqld



RUN wget http://central.maven.org/maven2/org/drizzle/jdbc/drizzle-jdbc/1.4/drizzle-jdbc-1.4.jar && mv drizzle-jdbc-1.4.jar /usr/local/tomcat/lib

ENTRYPOINT /entrypoint.sh
 
