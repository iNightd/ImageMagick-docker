FROM alpine:3.11
MAINTAINER chengliang <chengliang.duan@gmail.com>

ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$MAGICK_HOME/lib"
ENV BUILD_DIR=/root/build

RUN mkdir -p $BUILD_DIR

ADD $PWD/download.sh $BUILD_DIR
ADD $PWD/images $BUILD_DIR


WORKDIR $BUILD_DIR

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
 apk update && apk upgrade && apk add wget curl tar build-base xz pkgconfig && \
 cd $BUILD_DIR && chmod a+x ./download.sh && ./download.sh && echo "build dir on $BUILD_DIR" && \
 cd $BUILD_DIR && tar zxf ./zlib-1.2.11.tar.gz && cd zlib-1.2.11 && ./configure && sed -i 's/CC=gcc/CC=gcc -fPIC/g' ./Makefile && make && make install && \
 cd $BUILD_DIR && tar zxf ./bzip2-1.0.8.tar.gz && cd bzip2-1.0.8/ && sed -i 's/CC=gcc/CC=gcc -fPIC/g' ./Makefile && sed -i 's/CFLAGS=-Wall -Winline -O2 -g $(BIGFILES)/CFLAGS=-fPIC -Wall -Winline -O2 -g $(BIGFILES)/g' ./Makefile && make && make install && \
 cd $BUILD_DIR && tar zxf ./libpng-1.6.37.tar.gz && cd libpng-1.6.37 && ./configure && make && make install && \
 cd $BUILD_DIR && tar zxf ./libxml2-2.9.6.tar.gz && cd libxml2-2.9.6 && ./configure && make && make install && \
 cd $BUILD_DIR && tar zxf ./LibRaw-0.19.5.tar.gz  && cd LibRaw-0.19.5/ && ./configure && make && make install && \
 cd $BUILD_DIR && tar zxf ./jpegsrc.v9b.tar.gz && cd jpeg-9b && ./configure && make && make install && \
 cd $BUILD_DIR && tar zxf ./tiff-4.1.0.tar.gz && cd tiff-4.1.0 && ./configure && make && make install && \
 cd $BUILD_DIR && tar zxf ./giflib-5.2.1.tar.gz && cd giflib-5.2.1/ && make && make install && \
 cd $BUILD_DIR && tar zxf ./libwebp-1.1.0.tar.gz && cd libwebp-1.1.0/ && ./configure && make && make install && \
 cd $BUILD_DIR && tar zxf ./freetype-2.10.2.tar.gz && cd freetype-2.10.2/ && export CFLAGS=-fPIC && ./configure && make && make install && unset CFLAGS && \
 cd $BUILD_DIR && tar xJf ./harfbuzz-2.6.4.tar.xz && cd harfbuzz-2.6.4/ && ./configure && make && make install && \
 cd $BUILD_DIR && tar zxf ./ImageMagick-7.0.10-13.tar.gz && cd ImageMagick-7.0.10-13 && export CFLAGS=-fPIC && ./configure && make && make install && unset CFLAGS && \
 apk del wget curl tar xz && rm -rf $BUILD_DIR

CMD ["convert", "-V"]