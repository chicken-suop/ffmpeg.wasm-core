#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

FLAGS=(
  "${FFMPEG_CONFIG_FLAGS_BASE[@]}"
  --enable-gpl            # required by x264
  --enable-nonfree        # required by fdk-aac
  --enable-zlib           # enable zlib
  --enable-libopenh264    # enable openh264
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
  # --enable-libaom       # enable libaom

  --disable-all
  --enable-ffmpeg
  --enable-avcodec
  --enable-avformat
  --enable-avutil
  --enable-swresample
  --enable-swscale
  --enable-avfilter

  --enable-encoder=libopenh264,mpeg4,mov,gif
  --enable-decoder=rawvideo,hevc,libopenh264,mpeg4,gif
  --enable-parser=mpeg4video,mpegaudio,gif
  --enable-demuxer=mov,gif,concat,image2,image2pipe,mpegps
  --enable-muxer=mp4,gif,mov
  --enable-protocol=file
  --enable-filter=scale,overlay,fps,movie
)
echo "FFMPEG_CONFIG_FLAGS=${FLAGS[@]}"

emconfigure ./configure --help
emconfigure ./configure "${FLAGS[@]}"
