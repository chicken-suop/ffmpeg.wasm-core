#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

LIB_PATH=third_party/openh264

emmake make -C $LIB_PATH OS=linux ARCH=i686 ASM=yasm install-static

ls /usr/local | grep openh264
