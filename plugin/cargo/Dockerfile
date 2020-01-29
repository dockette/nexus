FROM maven:3-jdk-8

ENV NEXUS_VERSION=3.20.1
ENV NEXUS_BUILD=01
ENV POM_VERSION=3.12.0-01
ENV CARGO_REPO=https://github.com/sonatype-nexus-community/nexus-repository-cargo.git
ENV CARGO_VERSION=0.0.1
ENV CARGO_REV=331ac0b5ac26aa24f2bff9c11e06f10d54e42191

RUN apt update && apt dist-upgrade -y && \
    apt install -y git

WORKDIR /srv

RUN git clone ${CARGO_REPO} /srv
RUN git reset ${CARGO_REV} --hard
RUN sed -i "s/${POM_VERSION}/${NEXUS_VERSION}-${NEXUS_BUILD}/g" /srv/pom.xml
RUN mvn clean package
RUN mkdir -p /nexus && cp /srv/target/nexus-repository-cargo-${CARGO_VERSION}.jar /nexus/
