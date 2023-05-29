#!/bin/bash
set -Eeo pipefail

if [ ! -f /nexus-data/etc/nexus.properties ]; then
    echo "Setup nexus.properties ====================="
    mkdir -p /nexus-data/etc
    touch /nexus-data/etc/nexus.properties
    echo "nexus.skipDefaultRepositories=true" > /nexus-data/etc/nexus.properties
fi

echo "Chown /nexus-data =========================="
chown nexus:nexus /nexus-data

echo "Chown /nexus-data/etc (recursively) ========"
chown nexus:nexus -R /nexus-data/etc

echo "Start nexus ================================"
su -s /bin/bash nexus /opt/sonatype/nexus/bin/nexus run
