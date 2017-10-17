FROM maven:3-jdk-8-alpine
MAINTAINER Jose Angel Carvajal Soto <carvajal@fit.fhg.de>

ENV SERVER_USERNAME=pipelines
ENV SERVER_PASSWORD=""

#ENV version

# mounting configuration and extra dependencies volumes
VOLUME /data

WORKDIR /data

# starting the agent
ENTRYPOINT ["mvn","-s","settings.xml"]
