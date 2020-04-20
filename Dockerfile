FROM sonatype/nexus3:3.22.1

ENV NEXUS_VERSION=3.22.1
ENV NEXUS_BUILD=01
ENV NEXUS_TARGET=/opt/sonatype/nexus
ENV NEXUS_TARGET_DEPLOY=${NEXUS_TARGET}/deploy/

COPY --from=dockette/nexus:plugins-3.22.1 /nexus/*.jar ${NEXUS_TARGET_DEPLOY}
COPY --from=dockette/nexus:plugins-3.22.1 /nexus/*.kar ${NEXUS_TARGET_DEPLOY}

USER nexus
