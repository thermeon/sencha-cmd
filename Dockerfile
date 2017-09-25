FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN \ 
  apt-get update && apt-get install -y --no-install-recommends \
  openjdk-7-jre \
  curl \
  unzip \
  ruby

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/opt/Sencha/Cmd/6.5.1.240/sencha"]

ADD sencha-compass.zip /

RUN curl -o /cmd.run.zip http://cdn.sencha.com/cmd/6.5.1.240/SenchaCmd-6.5.1.240-linux-amd64.sh.zip && \
    unzip -p /cmd.run.zip > /cmd-install.run && \
    chmod +x /cmd-install.run && \
    /cmd-install.run -q -dir /opt/Sencha/Cmd/6.5.1.240 -Dall=true && \
    install -dm777 -o root -g root /opt/Sencha/Cmd/repo && \
    unzip /sencha-compass.zip && rm /sencha-compass.zip && \
    mv /sencha-compass /opt/Sencha/Cmd/6.5.1.240/extensions/sencha-compass && \
    rm /cmd-install.run /cmd.run.zip