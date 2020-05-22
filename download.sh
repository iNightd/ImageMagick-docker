#!/usr/bin/env bash

if [ $BUILD_DIR == '' ]; then
export BUILD_DIR=$PWD/images
fi

mkdir -p $BUILD_DIR && cd $BUILD_DIR

LIBPNG_URL=https://nchc.dl.sourceforge.net/project/libpng/libpng16/1.6.37/libpng-1.6.37.tar.gz
JPEG_URL=https://www.imagemagick.org/download/delegates/jpegsrc.v9b.tar.gz
FREETYPE_URL=https://liquidtelecom.dl.sourceforge.net/project/freetype/freetype2/2.10.2/freetype-2.10.2.tar.gz
HARFBUZZ_URL=https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-2.6.4.tar.xz
IMAGEMAGICK_URL=https://www.imagemagick.org/download/ImageMagick-7.0.10-13.tar.gz
LIBWEBP_URL=https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.1.0.tar.gz
LIBTIFF_URL=http://download.osgeo.org/libtiff/tiff-4.1.0.tar.gz
GIF_LIB_URL=https://nchc.dl.sourceforge.net/project/giflib/giflib-5.2.1.tar.gz
LIBXML_URL=https://www.imagemagick.org/download/delegates/libxml2-2.9.6.tar.gz
ZLIB_URL=https://www.imagemagick.org/download/delegates/zlib-1.2.11.tar.gz
LIBBZIP2_URL=https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz

resources=($LIBPNG_URL $JPEG_URL $FREETYPE_URL $HARFBUZZ_URL $IMAGEMAGICK_URL $LIBWEBP_URL $LIBTIFF_URL $GIF_LIB_URL $LIBXML_URL &ZLIB_URL &LIBBZIP2_URL)

for url in rouserces
do
  wget $url
  done

