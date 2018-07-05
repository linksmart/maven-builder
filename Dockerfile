FROM maven:3-jdk-10
MAINTAINER Jose Angel Carvajal Soto <carvajal@fit.fhg.de>

ENV SERVER_USERNAME=pipelines
ENV SERVER_PASSWORD=""

#ENV version
RUN adduser --system -u 1001 builder
USER builder

# mounting configuration and extra dependencies volumes
#VOLUME /data

WORKDIR /data


ADD settings.xml /maven/settings.xml
ADD settings.xml /data/settings.xml
ADD settings.xml /usr/share/maven/conf/settings.xml
ADD settings.xml /home/builder/settings.xml
ADD settings.xml /home/builder/.m2/settings.xml

USER root

RUN chown -R builder:1001 /data

USER builder


# starting the agent
ENTRYPOINT ["mvn","-s","/maven/settings.xml"]
