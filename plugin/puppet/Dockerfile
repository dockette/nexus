FROM maven:3-jdk-8

ENV NEXUS_VERSION=3.20.1
ENV NEXUS_BUILD=01
ENV POM_VERSION=3.14.0-04
ENV PUPPET_REPO=https://github.com/sonatype-nexus-community/nexus-repository-puppet.git
ENV PUPPET_VERSION=0.0.2
ENV PUPPET_REV=ecc11681efa382913ebe0fcb9acb27c5323fbff7

RUN apt update && apt dist-upgrade -y && \
    apt install -y git

WORKDIR /srv

RUN git clone ${PUPPET_REPO} /srv
RUN git reset ${PUPPET_REV} --hard
RUN sed -i "s/${POM_VERSION}/${NEXUS_VERSION}-${NEXUS_BUILD}/g" /srv/pom.xml
RUN mvn clean package
RUN mkdir -p /nexus && cp /srv/target/nexus-repository-puppet-${PUPPET_VERSION}.jar /nexus/
