#!/bin/bash

HOSTNAME=$(curl -s rancher-metadata/latest/self/host/name | cut -d'.' -f1)
HOSTNAME=${HOSTNAME:-defaultdocker}

HOST_LIST=($HOSTS)

exec bin/ethminer --farm-recheck 2000 -S ${HOST_LIST}[0] -O ${WALLET_ADDRESS}.${HOSTNAME} -FF ${HOST_LIST[1]} -G $ETHMINER_OPTS
