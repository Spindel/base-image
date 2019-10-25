#!/bin/bash
set -eo pipefail
LATEST_URL=https://api.github.com/repos/stanhu/pgbouncer_exporter/releases/latest
# Pretty hack to get the latest amd64 binary from the github api
LATEST_AMD64=$(curl -s ${LATEST_URL} |sed -n 's/.*browser_download_url.*\(https.*linux-amd64.tar.gz\).*$/\1/p')

# Download to "pgbouncer.tgz"
curl -s -L -o pgbouncer.tgz  "${LATEST_AMD64}"
# List files, as a convenience to the user
echo "${LATEST_AMD64}"
tar -tzvf pgbouncer.tgz

# Extract to pgbouncer_exporter
tar -Ozxf pgbouncer.tgz '*/pgbouncer_exporter'  > pgbouncer_exporter
rm -f pgbouncer.tgz
chmod +x pgbouncer_exporter
