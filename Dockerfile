FROM sonatype/nexus3:3.20.1

ENV NEXUS_VERSION=3.20.1
ENV NEXUS_BUILD=01
ENV NEXUS_TARGET=/opt/sonatype/nexus
ENV NEXUS_TARGET_DEPLOY=${NEXUS_TARGET}/deploy

# Plugin: Composer #####################

ENV NEXUS_COMPOSER_VERSION=0.0.2
COPY --from=dockette/nexus:plugin-composer /nexus/nexus-repository-composer-${NEXUS_COMPOSER_VERSION}.jar ${NEXUS_TARGET_DEPLOY}

# Plugin: Helm #########################

ENV NEXUS_HELM_VERSION=0.0.13
COPY --from=dockette/nexus:plugin-helm /nexus/nexus-repository-helm-${NEXUS_HELM_VERSION}.jar ${NEXUS_TARGET_DEPLOY}

# Plugin: Cpan #########################

ENV NEXUS_CPAN_VERSION=0.0.1
COPY --from=dockette/nexus:plugin-cpan /nexus/nexus-repository-cpan-${NEXUS_CPAN_VERSION}.jar ${NEXUS_TARGET_DEPLOY}

# Plugin: P2 ###########################

ENV NEXUS_P2_VERSION=0.0.4-SNAPSHOT 
COPY --from=dockette/nexus:plugin-p2 /nexus/nexus-repository-p2-${NEXUS_P2_VERSION}.jar ${NEXUS_TARGET_DEPLOY}

# Plugin: Cargo ########################

ENV NEXUS_CARGO_VERSION=0.0.1
COPY --from=dockette/nexus:plugin-cargo /nexus/nexus-repository-cargo-${NEXUS_CARGO_VERSION}.jar ${NEXUS_TARGET_DEPLOY}

# Plugin: Conan ########################

ENV NEXUS_CONAN_VERSION=0.0.6
COPY --from=dockette/nexus:plugin-conan /nexus/nexus-repository-conan-${NEXUS_CONAN_VERSION}.jar ${NEXUS_TARGET_DEPLOY}

# Plugin: Puppet #######################

ENV NEXUS_PUPPET_VERSION=0.0.2
COPY --from=dockette/nexus:plugin-puppet /nexus/nexus-repository-puppet-${NEXUS_PUPPET_VERSION}.jar ${NEXUS_TARGET_DEPLOY}

# Plugin: VGO #######################

ENV NEXUS_VGO_VERSION=0.0.1
COPY --from=dockette/nexus:plugin-vgo /nexus/nexus-repository-vgo-${NEXUS_VGO_VERSION}.jar ${NEXUS_TARGET_DEPLOY}

# Permissions ##########################

USER nexus
