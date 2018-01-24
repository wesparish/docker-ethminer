#!/bin/bash

docker build -t wesparish/ethminer:amd-v0.13.0 . && \
  docker push wesparish/ethminer:amd-v0.13.0
