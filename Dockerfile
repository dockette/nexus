FROM sonatype/nexus3:3.21.1

ENV NEXUS_VERSION=3.21.1
ENV NEXUS_BUILD=01
ENV NEXUS_TARGET=/opt/sonatype/nexus
ENV NEXUS_TARGET_DEPLOY=${NEXUS_TARGET}/deploy

# Repositories #########################

ENV NEXUS_COMPOSER_VERSION=0.0.5-SNAPSHOT
COPY --from=dockette/nexus:plugins-3.21.1 /nexus/nexus-repository-composer-${NEXUS_COMPOSER_VERSION}.jar ${NEXUS_TARGET_DEPLOY}

ENV NEXUS_CPAN_VERSION=0.0.1
COPY --from=dockette/nexus:plugins-3.21.1 /nexus/nexus-repository-cpan-${NEXUS_CPAN_VERSION}.jar ${NEXUS_TARGET_DEPLOY}

ENV NEXUS_CARGO_VERSION=0.0.1
COPY --from=dockette/nexus:plugins-3.21.1 /nexus/nexus-repository-cargo-${NEXUS_CARGO_VERSION}.jar ${NEXUS_TARGET_DEPLOY}

ENV NEXUS_CONAN_VERSION=0.0.6
COPY --from=dockette/nexus:plugins-3.21.1 /nexus/nexus-repository-conan-${NEXUS_CONAN_VERSION}.jar ${NEXUS_TARGET_DEPLOY}

ENV NEXUS_PUPPET_VERSION=0.0.2
COPY --from=dockette/nexus:plugins-3.21.1 /nexus/nexus-repository-puppet-${NEXUS_PUPPET_VERSION}.jar ${NEXUS_TARGET_DEPLOY}

# ENV NEXUS_VGO_VERSION=0.0.1
# COPY --from=dockette/nexus:plugins-3.21.1 /nexus/nexus-repository-vgo-${NEXUS_VGO_VERSION}.jar ${NEXUS_TARGET_DEPLOY}

# Blobstores ###########################

ENV NEXUS_AZURE_VERSION=0.5.0-SNAPSHOT
COPY --from=dockette/nexus:plugins-3.21.1 /nexus/nexus-blobstore-azure-cloud-${NEXUS_AZURE_VERSION}-sources.jar ${NEXUS_TARGET_DEPLOY}

ENV NEXUS_GOOGLE_VERSION=0.11.1-SNAPSHOT
COPY --from=dockette/nexus:plugins-3.21.1 /nexus/nexus-blobstore-google-cloud-${NEXUS_GOOGLE_VERSION}.kar ${NEXUS_TARGET_DEPLOY}

# Permissions ##########################

USER nexus
