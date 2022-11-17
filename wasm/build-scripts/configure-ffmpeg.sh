#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

FLAGS=(
  "${FFMPEG_CONFIG_FLAGS_BASE[@]}"
  --disable-all # Do not remove
  --disable-network
  --disable-autodetect
  --disable-debug
  --disable-ffplay
  --disable-ffprobe
  --disable-doc

  # --enable-small          # optimize for size instead of speed
  --enable-gpl            # required by x264
  --enable-nonfree        # required by fdk-aac
  --enable-zlib           # enable zlib
  --enable-libx264        # enable x264
  --enable-libvpx         # enable libvpx / webm
  --enable-libwavpack     # enable libwavpack
  --enable-libfdk-aac     # enable libfdk-aac
  --enable-libtheora      # enable libtheora
  --enable-libvorbis      # enable libvorbis
  --enable-libopus        # enable opus
  --enable-libwebp        # enable libwebp

  --enable-avdevice       # enable lavfi and anullsrc
  --enable-avcodec
  --enable-avformat
  --enable-avfilter
  --enable-avutil
  --enable-swresample
  --enable-swscale

  --enable-indev=lavfi
  --enable-bsf=h264_mp4toannexb,aac_adtstoasc
  --enable-encoder=mp4,gif,mov,libx264,mpeg*,mov,gif,h264,aac*,libfdk_aac
  --enable-decoder=rawvideo,hevc,aac*,h264,mp3,mp4,mpeg*,gif,libfdk_aac
  --enable-parser=ac3,aac*,flac,h264,mpeg*,vorbis,vp8,vp9,gif
  # mov demuxer/muxer adds: mov,mp4,m4a,3gp,3g2,mj2
  --enable-demuxer=mov,gif,matroska,image2
  --enable-muxer=mp4,gif,mov
  --enable-protocol=file
  --enable-filter=scale,overlay,fps,movie
)
echo "FFMPEG_CONFIG_FLAGS=${FLAGS[@]}"

emconfigure ./configure "${FLAGS[@]}"