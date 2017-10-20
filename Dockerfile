FROM maven:3-jdk-8-alpine
MAINTAINER Jose Angel Carvajal Soto <carvajal@fit.fhg.de>

ENV SERVER_USERNAME=pipelines
ENV SERVER_PASSWORD=""

#ENV version
RUN adduser -u 1000 -S builder
USER builder

# add git for deployment plugin
RUN apk add --no-cache git

# mounting configuration and extra dependencies volumes
VOLUME /data

WORKDIR /data

ADD settings.xml /maven/settings.xml
#ONBUILD ADD .m2/settings.xml .

# starting the agent
ENTRYPOINT ["mvn","-s","/maven/settings.xml"]
