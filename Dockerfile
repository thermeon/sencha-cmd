FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

ENV VERSION=6.6.0.13

RUN \ 
  apt-get update && apt-get install -y --no-install-recommends \
  openjdk-7-jre \
  curl \
  unzip \
  ruby

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/opt/Sencha/Cmd/6.6.0.13/sencha"]

ADD sencha-compass.zip /

RUN curl -o /cmd.run.zip http://cdn.sencha.com/cmd/$VERSION/no-jre/SenchaCmd-$VERSION-linux-amd64.sh.zip && \
    unzip -p /cmd.run.zip > /cmd-install.run && \
    chmod +x /cmd-install.run && \
    /cmd-install.run -q -dir /opt/Sencha/Cmd/$VERSION -Dall=true && \
    install -dm777 -o root -g root /opt/Sencha/Cmd/repo && \
    unzip /sencha-compass.zip && rm /sencha-compass.zip && \
    mv /sencha-compass /opt/Sencha/Cmd/$VERSION/extensions/sencha-compass && \
    rm /cmd-install.run /cmd.run.zip
