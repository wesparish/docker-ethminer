#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DIR=$(basename $DIR)

docker build -t wesparish/ethminer:amdgpu-pro-${DIR} . && \
  docker push wesparish/ethminer:amdgpu-pro-${DIR} 
