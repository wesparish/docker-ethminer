#!/bin/bash

docker build -t wesparish/ethminer:nvidia-v0.13.0 . && \
  docker push wesparish/ethminer:nvidia-v0.13.0 
