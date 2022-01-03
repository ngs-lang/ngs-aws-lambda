#!/usr/bin/env bash

set -eu

echo "[make-layer.sh] Copying"
cp -a /make-layer/src /make-layer/src-rw
cd /make-layer/src-rw
rm -rf build

echo "[make-layer.sh] Running install.sh"
./install.sh

echo "[make-layer.sh] Copying out"

mkdir -p /make-layer/out/bin
cp -a /usr/local/bin/ngs /make-layer/out/bin/

mkdir -p /make-layer/out/lib
cp -a /usr/local/lib/ngs /make-layer/out/lib/ngs

echo "[make-layer.sh] Done"
