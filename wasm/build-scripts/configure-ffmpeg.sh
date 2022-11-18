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

  --enable-decoder=aac,aac_latm,h264,mp3,mpeg4,rawvideo
  --enable-encoder=aac,h264,libx264,mpeg4
  --enable-protocol=file
  --enable-demuxer=aac,h264,mov,m4v,mp3,wav
  --enable-muxer=mp4,h264
  --enable-parser=aac,h264,mpeg4video
  --enable-bsf=aac_adtstoasc
  --enable-filter=fps,split,palettegen,fifo,paletteuse,scale,overlay
)
echo "FFMPEG_CONFIG_FLAGS=${FLAGS[@]}"

emconfigure ./configure "${FLAGS[@]}"