#!/bin/bash
set -Eeo pipefail

echo "Chown /nexus-data =========================="
chown nexus:nexus /nexus-data

echo "Start nexus ================================"
su -s /bin/bash nexus /opt/sonatype/nexus/bin/nexus run
