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

# cd /make-layer/src-rw/build
# ldd ngs
# ( also copy ngs to clean amazonlinux container and ldd there -
#   determine which libraries should not be included - whatever is present (not "not found") should not
#   be in the list below)
for lib in libgc libjson-c libatomic_ops libgcc_s;do
	cp -a /lib64/${lib}* /make-layer/out/lib/
done

ngs --version >/make-layer/out/ngs-version

echo "[make-layer.sh] Done"
