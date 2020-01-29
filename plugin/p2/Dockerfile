FROM maven:3-jdk-8

ENV NEXUS_VERSION=3.20.1
ENV NEXUS_BUILD=01
ENV POM_VERSION=3.19.1-01
ENV P2_REPO=https://github.com/sonatype-nexus-community/nexus-repository-p2.git
ENV P2_VERSION=0.0.4-SNAPSHOT
ENV P2_REV=30134301f05834745e62495ab741355e1e52da28

RUN apt update && apt dist-upgrade -y && \
    apt install -y git

WORKDIR /srv

RUN git clone ${P2_REPO} /srv
RUN git reset ${P2_REV} --hard
RUN sed -i "s/${POM_VERSION}/${NEXUS_VERSION}-${NEXUS_BUILD}/g" /srv/pom.xml
RUN mvn clean package
RUN mkdir -p /nexus && cp /srv/nexus-repository-p2/target/nexus-repository-p2-${P2_VERSION}.jar /nexus/
