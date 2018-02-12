#!/bin/bash

VARIANT_LIST=(amd nvidia)

for variant in ${VARIANT_LIST[@]}; do
  echo "*** BUILDING $variant ***"
  pushd $variant
  ./build.sh
  popd
done
