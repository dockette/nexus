FROM maven:3-jdk-8

ENV NEXUS_VERSION=3.20.1
ENV NEXUS_BUILD=01
ENV POM_VERSION=3.13.0-01
ENV CHEF_REPO=https://github.com/sonatype-nexus-community/nexus-repository-chef.git
ENV CHEF_VERSION=0.0.1
ENV CHEF_REV=c4c0676fee1cfa46de84f93ae82fe1f4ec3a6641

RUN apt update && apt dist-upgrade -y && \
    apt install -y git

WORKDIR /srv

RUN git clone ${CHEF_REPO} /srv
RUN git reset ${CHEF_REV} --hard
RUN sed -i "s/${POM_VERSION}/${NEXUS_VERSION}-${NEXUS_BUILD}/g" /srv/pom.xml
RUN mvn clean package
RUN mkdir -p /nexus && cp /srv/target/nexus-repository-chef-${CHEF_VERSION}.jar /nexus/
