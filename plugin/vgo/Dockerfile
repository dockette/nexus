FROM maven:3-jdk-8

ENV NEXUS_VERSION=3.20.1
ENV NEXUS_BUILD=01
ENV POM_VERSION=3.15.2-01
ENV VGO_REPO=https://github.com/sonatype-nexus-community/nexus-repository-vgo.git
ENV VGO_VERSION=0.0.1
ENV VGO_REV=393355341163e9ee358827d4623e81dd41bf1656

RUN apt update && apt dist-upgrade -y && \
    apt install -y git

WORKDIR /srv

RUN git clone ${VGO_REPO} /srv
RUN git reset ${VGO_REV} --hard
RUN sed -i "s/${POM_VERSION}/${NEXUS_VERSION}-${NEXUS_BUILD}/g" /srv/pom.xml
RUN mvn clean package
RUN mkdir -p /nexus && cp /srv/target/nexus-repository-vgo-${VGO_VERSION}.jar /nexus/
