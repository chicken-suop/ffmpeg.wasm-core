#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

FLAGS=(
  "${FFMPEG_CONFIG_FLAGS_BASE[@]}"
  --disable-all
  --enable-nonfree        # required for libfdk_aac
  --enable-gpl            # required by x264
  --enable-libx264        # enable x264
  --enable-libfdk-aac     # enable fdk-aac

  --enable-avdevice
  --enable-avutil
  --enable-avcodec        # enable native AAC decoder
  --enable-avformat
  --enable-avfilter
  --enable-swresample
  --enable-swscale

  --enable-decoder=aac*,h264
  --enable-encoder=aac,libx264
  --enable-protocol=file
  --enable-demuxer=aac,h264,mov
  --enable-muxer=mp4,h264
  --enable-parser=aac,h264
  --enable-bsf=aac_adtstoasc
  --enable-filter=fps,split,palettegen,fifo,paletteuse,scale,overlay
)
echo "FFMPEG_CONFIG_FLAGS=${FLAGS[@]}"

emconfigure ./configure "${FLAGS[@]}"