FROM gitpod/workspace-full
                    
USER gitpod

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && #     sudo apt-get install -yq bastet && #     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/config-docker/


RUN sudo apt-get -q update && sudo apt-get install -yq jekyll bundler libvips-dev libvips42 libglib2.0-0 nodejs npm ruby2.5-dev 

# useful build tools ... we need gtk-doc to build orc, since they don't ship
# pre-baked tarballs
RUN sudo apt-get update && sudo apt-get install -y \
	build-essential \
	autoconf \
	automake \
	libtool \
	intltool \
	gtk-doc-tools \
	unzip \
	wget \
	git \
	pkg-config 

# heroku:18 includes some libraries, like tiff and jpeg, as part of the
# run-time platform, and we want to use those libs if we can
#
# see https://devcenter.heroku.com/articles/stack-packages
#
# libgsf needs libxml2
RUN sudo apt-get install -y \
	glib-2.0-dev \
	libexpat-dev \
	librsvg2-dev \
	libpng-dev \
	libjpeg-dev \
	libtiff5-dev \
	libexif-dev \
	liblcms2-dev \
	libxml2-dev \
	libfftw3-dev 

ARG GIFLIB_VERSION=5.1.4
ARG GIFLIB_URL=http://downloads.sourceforge.net/project/giflib

RUN cd /usr/local/src \
	&& sudo wget http://downloads.sourceforge.net/project/giflib/giflib-5.1.4.tar.bz2 \
	&& sudo tar xf giflib-5.1.4.tar.bz2 \
	&& cd giflib-5.1.4 \
	&& sudo ./configure --prefix=/usr/local/vips \
	&& sudo make \
	&& sudo make install

# orc uses ninja and meson to build
RUN sudo apt-get install -y \
    python3-pip 
RUN sudo pip3 install ninja meson

ARG ORC_VERSION=0.4.31
ARG ORC_URL=https://github.com/GStreamer/orc/archive

RUN cd /usr/local/src \
	&& sudo wget https://github.com/GStreamer/orc/archive/0.4.31.tar.gz \
	&& sudo tar xf 0.4.31.tar.gz \
	&& cd orc-0.4.31 \
	&& sudo meson build --prefix=/usr/local/vips --libdir=/usr/local/vips/lib \
	&& cd build \
	&& sudo ninja \
	&& sudo ninja install

ARG GSF_VERSION=1.14.46
ARG GSF_URL=http://ftp.gnome.org/pub/GNOME/sources/libgsf

RUN cd /usr/local/src \
	&& sudo wget ftp.gnome.org/pub/GNOME/sources/libgsf/1.14/libgsf-1.14.46.tar.xz \
	&& sudo tar xf libgsf-1.14.46.tar.xz \
	&& cd libgsf-1.14.46 \
	&& sudo ./configure --prefix=/usr/local/vips --disable-gtk-doc \
	&& sudo make \
	&& sudo make install

ARG VIPS_VERSION=8.9.0
ARG VIPS_URL=https://github.com/libvips/libvips/releases/download

RUN cd /usr/src \
	&& sudo wget https://github.com/libvips/libvips/releases/download/v8.9.0/vips-8.9.0.tar.gz \
	&& sudo tar xzf vips-8.9.0.tar.gz \
	&& cd vips-8.9.0 \
	&& sudo export PKG_CONFIG_PATH=/usr/local/vips/lib/pkgconfig \
	&& sudo ./configure --prefix=/usr/local/vips --disable-gtk-doc \
	&& sudo make \
	&& sudo make install

# clean the build area and make a tarball ready for packaging
RUN cd /usr/local/vips \
	&& sudo rm bin/gif* bin/orc* bin/gsf* bin/batch_* bin/vips-8.9 \
	&& sudo rm bin/vipsprofile bin/light_correct bin/shrink_width \
	&& sudo strip lib/*.a lib/lib*.so* \
	&& sudo rm -rf share/gtk-doc \
	&& sudo rm -rf share/man \
	&& sudo rm -rf share/thumbnailers \
	&& cd /usr/local \
	&& sudo tar cfz libvips-dev-8.9.0.tar.gz vips

# ruby-vips needs ffi, and ffi needs the dev headers for ruby
RUN sudo apt-get install -y \
    ruby-dev 

# test ruby-vips
RUN export LD_LIBRARY_PATH=/usr/local/vips/lib \
	&& gem install ruby-vips \
	&& ruby -e 'require "ruby-vips"; puts "success!"'
