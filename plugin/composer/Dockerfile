FROM maven:3-jdk-8

ENV NEXUS_VERSION=3.20.1
ENV NEXUS_BUILD=01
ENV POM_VERSION=3.19.1-01
ENV COMPOSER_REPO=https://github.com/sonatype-nexus-community/nexus-repository-composer.git
ENV COMPOSER_VERSION=0.0.2
ENV COMPOSER_REV=6727417907f0cf22393ce5a1f2eb083e926681b9

RUN apt update && apt dist-upgrade -y && \
    apt install -y git

WORKDIR /srv

RUN git clone ${COMPOSER_REPO} /srv
RUN git reset ${COMPOSER_REV}} --hard
RUN sed -i "s/${POM_VERSION}/${NEXUS_VERSION}-${NEXUS_BUILD}/g" /srv/pom.xml
RUN mvn clean package
RUN mkdir -p /nexus && cp /srv/nexus-repository-composer/target/nexus-repository-composer-${COMPOSER_VERSION}.jar /nexus/
