FROM maven:3-jdk-8

ENV NEXUS_VERSION=3.20.1
ENV NEXUS_BUILD=01
ENV POM_VERSION=3.19.0-SNAPSHOT
ENV CPAN_REPO=https://github.com/sonatype-nexus-community/nexus-repository-cpan.git
ENV CPAN_VERSION=0.0.1
ENV CPAN_REV=5f1fb44ac573869ca3ad071b09d1294dde243f39

RUN apt update && apt dist-upgrade -y && \
    apt install -y git

WORKDIR /srv

RUN git clone ${CPAN_REPO} /srv
RUN git reset ${CPAN_REV} --hard
RUN sed -i "s/${POM_VERSION}/${NEXUS_VERSION}-${NEXUS_BUILD}/g" /srv/pom.xml
RUN mvn clean package
RUN mkdir -p /nexus && cp /srv/nexus-repository-cpan/target/nexus-repository-cpan-${CPAN_VERSION}.jar /nexus/
