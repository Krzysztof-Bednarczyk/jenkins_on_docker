FROM jenkins/ssh-agent:latest-debian-jdk17

USER root

RUN apt-get update && apt-get install -y gzip wget

WORKDIR /opt

RUN wget -c https://dlcdn.apache.org/maven/maven-3/3.9.3/binaries/apache-maven-3.9.3-bin.tar.gz -O - | tar -xz

ENV M2_HOME=/opt/apache-maven-3.9.3
ENV PATH=/opt/apache-maven-3.9.3/bin:/opt/java/openjdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin