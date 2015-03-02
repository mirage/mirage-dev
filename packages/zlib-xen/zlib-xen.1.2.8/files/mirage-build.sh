#!/bin/sh -ex
PREFIX=`opam config var prefix`
PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"
export PKG_CONFIG_PATH

if pkg-config --exists mirage-xen; then
  CFLAGS="$CFLAGS `pkg-config mirage-xen --cflags` -O2 -fomit-frame-pointer -fno-builtin \
            -D_FORTIFY_SOURCE=0 -Wmissing-prototypes -DHAVE_snprintf --std=gnu99"
   ZLIBGCCWARN=YES CFLAGS="$CFLAGS" CC=gcc ./configure --static --prefix="$PREFIX/lib/zlib" --solo
  make libz.a
else
  echo -n "'mirage-xen' is not installed, stopping."
  exit 1
fi
