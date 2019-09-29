#!/usr/bin/env bash

#HOSTNAME=$(curl -s rancher-metadata/latest/self/host/name | cut -d'.' -f1)
HOSTNAME=${NODE_NAME:-localhost}

# Build -P address
P_ADDRESS_LIST=
IFS=' ' read -ra HOST_LIST <<< "$HOSTS"
for i in "${HOST_LIST[@]}"; do
  if [ -n "$PASSPHRASE" ]; then 
    P_ADDRESS_LIST="$P_ADDRESS_LIST -P stratum://${WALLET_ADDRESS}.${HOSTNAME}:${PASSPHRASE}@${i}"
  else
    P_ADDRESS_LIST="$P_ADDRESS_LIST -P stratum://${WALLET_ADDRESS}.${HOSTNAME}@${i}"
  fi
done

echo "Executing: ./bin/ethminer $OPTS $P_ADDRESS_LIST $@" 
exec ./bin/ethminer $OPTS $P_ADDRESS_LIST $@
