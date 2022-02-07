#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

LIB_PATH=third_party/openh264

CONF_FLAGS=(
  --prefix=$BUILD_DIR           # install library in a build directory for FFmpeg to include
)
echo "CONF_FLAGS=${CONF_FLAGS[@]}"
(cd $LIB_PATH && emconfigure ./configure "${CONF_FLAGS[@]}")
emmake make -C $LIB_PATH OS=linux ARCH=i686 ASM=yasm install-static
