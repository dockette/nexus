ARG NEXUS_VERSION=3.65.0

FROM maven:3.9.0 as builder

# Blobstores
# RUN mvn -U org.apache.maven.plugins:maven-dependency-plugin:3.0.1:copy -Dartifact=org.sonatype.nexus.plugins:nexus-blobstore-google-cloud:0.20.0 -DoutputDirectory=/nexus

# Repositories
RUN mvn -U org.apache.maven.plugins:maven-dependency-plugin:3.0.1:copy -Dartifact=org.sonatype.nexus.plugins:nexus-repository-apk:0.0.26 -DoutputDirectory=/nexus
# RUN mvn -U org.apache.maven.plugins:maven-dependency-plugin:3.0.1:copy -Dartifact=org.sonatype.nexus.plugins:nexus-repository-cargo:0.0.7 -DoutputDirectory=/nexus
RUN mvn -U org.apache.maven.plugins:maven-dependency-plugin:3.0.1:copy -Dartifact=org.sonatype.nexus.plugins:nexus-repository-composer:0.0.29 -DoutputDirectory=/nexus
RUN mvn -U org.apache.maven.plugins:maven-dependency-plugin:3.0.1:copy -Dartifact=org.sonatype.nexus.plugins:nexus-repository-cpan:0.0.10 -DoutputDirectory=/nexus
# RUN mvn -U org.apache.maven.plugins:maven-dependency-plugin:3.0.1:copy -Dartifact=org.sonatype.nexus.plugins:nexus-repository-puppet:0.1.2 -DoutputDirectory=/nexus

FROM sonatype/nexus3:$NEXUS_VERSION

COPY --from=builder /nexus/*.jar /opt/sonatype/nexus/deploy/

USER root

RUN microdnf install util-linux && \
    microdnf clean all

COPY entrypoint.sh /entrypoint.sh

RUN chmod 755 /entrypoint.sh

CMD ["/entrypoint.sh"]
