FROM maven:3-jdk-8-alpine
MAINTAINER Jose Angel Carvajal Soto <carvajal@fit.fhg.de>

ENV SERVER_USERNAME=pipelines
ENV SERVER_PASSWORD=""

#ENV version
RUN adduser -u 1000 -S builder
USER builder

# mounting configuration and extra dependencies volumes
VOLUME /data

WORKDIR /data

# starting the agent
ENTRYPOINT ["mvn","-s","settings.xml"]
