FROM maven:3-jdk-8

ENV NEXUS_VERSION=3.20.1
ENV NEXUS_BUILD=01
ENV POM_VERSION=3.19.1-01
ENV AZURE_REPO=https://github.com/sonatype-nexus-community/nexus-blobstore-azure-cloud.git
ENV AZURE_VERSION=0.4.0-SNAPSHOT
ENV AZURE_REV=4be8e0454ed2c179839cd3dd06b40bacd656d1b7

RUN apt update && apt dist-upgrade -y && \
    apt install -y git

WORKDIR /srv

RUN git clone ${AZURE_REPO} /srv
RUN git reset ${AZURE_REV} --hard
RUN sed -i "s/${POM_VERSION}/${NEXUS_VERSION}-${NEXUS_BUILD}/g" /srv/pom.xml
RUN mvn clean package
RUN mkdir -p /nexus && cp /srv/target/nexus-blobstore-azure-cloud-${AZURE_VERSION}-bundle.kar /nexus/
