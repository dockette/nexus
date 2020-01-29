FROM maven:3-jdk-8

ENV NEXUS_VERSION=3.20.1
ENV NEXUS_BUILD=01
ENV POM_VERSION=3.20.0-02
ENV GOOGLE_REPO=https://github.com/sonatype-nexus-community/nexus-blobstore-google-cloud.git
ENV GOOGLE_VERISON=0.10.1
ENV GOOGLE_REV=6bea48da7b1f783229192dec027319f7bd2d9019

RUN apt update && apt dist-upgrade -y && \
    apt install -y git

WORKDIR /srv

RUN git clone ${GOOGLE_REPO} /srv
RUN git reset ${GOOGLE_REV} --hard
RUN sed -i "s/${POM_VERSION}/${NEXUS_VERSION}-${NEXUS_BUILD}/g" /srv/pom.xml
RUN mvn clean package
RUN mkdir -p /nexus && cp /srv/target/nexus-blobstore-google-cloud-${GOOGLE_VERISON}.kar /nexus/
