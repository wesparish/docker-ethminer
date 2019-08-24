#!/usr/bin/env bash

#HOSTNAME=$(curl -s rancher-metadata/latest/self/host/name | cut -d'.' -f1)
HOSTNAME=${NODE_NAME:-localhost}

# Build -P address
P_ADDRESS_LIST=
IFS=' ' read -ra HOST_LIST <<< "$HOSTS"
for i in "${HOST_LIST[@]}"; do
  P_ADDRESS_LIST="$P_ADDRESS_LIST -P stratum://${WALLET_ADDRESS}.${HOSTNAME}@${i}"
done

echo "Executing: ./bin/ethminer $OPTS $P_ADDRESS_LIST $@" 
exec ./bin/ethminer $OPTS $P_ADDRESS_LIST $@
