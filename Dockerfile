FROM alpine:3.11
MAINTAINER chengliang <chengliang.duan@gmail.com>

#ENV PATH="$MAGICK_HOME/bin:$PATH"
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$MAGICK_HOME/lib"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
  apk update && apk upgrade && apk add wget curl tar build-base xz pkgconfig libzip-dev

ADD ./images/ /root/build

RUN cd /root/build && tar zxf ./libpng-1.6.37.tar.gz && cd libpng-1.6.37 && ./configure && make && make install && \
  cd /root/build && tar zxf ./libxml2-2.9.6.tar.gz && cd libxml2-2.9.6 && ./configure && make && make install && \
  cd /root/build && tar zxf ./LibRaw-0.19.5.tar.gz  && cd LibRaw-0.19.5/ && ./configure && make && make install && \
  cd /root/build && tar zxf ./jpegsrc.v9b.tar.gz && cd jpeg-9b && ./configure && make && make install && \
  cd /root/build && tar zxf ./tiff-4.1.0.tar.gz && cd tiff-4.1.0 && ./configure && make && make install && \
  cd /root/build && tar zxf ./giflib-5.2.1.tar.gz && cd giflib-5.2.1/ && make && make install && \
  cd /root/build && tar zxf ./libwebp-1.1.0.tar.gz && cd libwebp-1.1.0/ && ./configure && make && make install && \
  cd /root/build && tar zxf ./freetype-2.10.2.tar.gz && cd freetype-2.10.2/ && ./configure --with-bzip2=no && make && make install && \
  cd /root/build && tar xJf ./harfbuzz-2.6.4.tar.xz && cd harfbuzz-2.6.4/ && ./configure && make && make install && \
  cd /root/build && tar zxf ./ImageMagick-7.0.10-13.tar.gz && cd ImageMagick-7.0.10-13 && ./configure && make && make install
