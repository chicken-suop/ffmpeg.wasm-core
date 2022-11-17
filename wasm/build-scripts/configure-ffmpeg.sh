#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

FLAGS=(
  "${FFMPEG_CONFIG_FLAGS_BASE[@]}"
  --disable-everything
  --disable-network
  --disable-autodetect

  # --enable-small          # optimize for size instead of speed
  --enable-gpl            # required by x264
  --enable-nonfree        # required by fdk-aac
  --enable-zlib           # enable zlib
  --enable-libx264        # enable x264
  --enable-libx265        # enable x265
  --enable-libvpx         # enable libvpx / webm
  --enable-libwavpack     # enable libwavpack
  --enable-libmp3lame     # enable libmp3lame
  --enable-libfdk-aac     # enable libfdk-aac
  --enable-libtheora      # enable libtheora
  --enable-libvorbis      # enable libvorbis
  --enable-libfreetype    # enable freetype
  --enable-libopus        # enable opus
  --enable-libwebp        # enable libwebp
  --enable-libass         # enable libass
  --enable-libfribidi     # enable libfribidi

  --enable-indev=lavfi
  --enable-bsf=h264_mp4toannexb,aac_adtstoasc
  --enable-parser=h264
  --enable-encoder=mpeg4,mov,gif,h264,libx264,rawvideo
  --enable-decoder=rawvideo,aac*,h264,mp3,mp4,mpeg*,gif,aac*,ac3*,opus,vorbis
  # mov demuxer/muxer adds: mov,mp4,m4a,3gp,3g2,mj2
  --enable-demuxer=mov,gif,matroska,image2,m4v
  --enable-muxer=mp4,gif,mov,rawvideo
  --enable-protocol=file
  --enable-filter=scale,overlay,fps,movie
)
echo "FFMPEG_CONFIG_FLAGS=${FLAGS[@]}"

emconfigure ./configure "${FLAGS[@]}"
