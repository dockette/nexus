FROM maven:3-jdk-8

ENV NEXUS_VERSION=3.20.1
ENV NEXUS_BUILD=01
ENV POM_VERSION=3.18.1-01
ENV CONAN_VERSION=0.0.6

RUN apt update && apt dist-upgrade -y && \
    apt install -y git

WORKDIR /srv

RUN git clone https://github.com/sonatype-nexus-community/nexus-repository-conan.git /srv
RUN sed -i "s/${POM_VERSION}/${NEXUS_VERSION}-${NEXUS_BUILD}/g" /srv/pom.xml
RUN mvn clean package
RUN mkdir -p /nexus && cp /srv/target/nexus-repository-conan-${CONAN_VERSION}.jar /nexus/
