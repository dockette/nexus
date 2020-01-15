FROM maven:3-jdk-8

ENV NEXUS_VERSION=3.20.1
ENV NEXUS_BUILD=01
ENV POM_VERSION=3.19.1-01
ENV P2_VERSION=0.0.4-SNAPSHOT

RUN apt update && apt dist-upgrade -y && \
    apt install -y git

WORKDIR /srv

RUN git clone https://github.com/sonatype-nexus-community/nexus-repository-p2.git /srv
RUN sed -i "s/${POM_VERSION}/${NEXUS_VERSION}-${NEXUS_BUILD}/g" /srv/pom.xml
RUN mvn clean package
RUN mkdir -p /nexus && cp /srv/nexus-repository-p2/target/nexus-repository-p2-${P2_VERSION}.jar /nexus/
