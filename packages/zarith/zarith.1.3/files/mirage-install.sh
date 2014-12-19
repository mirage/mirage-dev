#!/bin/sh -eux

PREFIX=`opam config var prefix`
PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"
export PKG_CONFIG_PATH

CFLAGS=`pkg-config --cflags gmp`
LDFLAGS=`pkg-config --libs gmp`
export CFLAGS
export LDFLAGS

./configure
make
make install

if pkg-config --exists mirage-xen; then
  make clean
  # WARNING: if you pass invalid cflags here, zarith will silently
  # fall back to compiling with the default flags instead!
  CFLAGS="`pkg-config --cflags gmp mirage-xen` -O2 -pedantic -fomit-frame-pointer -fno-builtin"
  export CFLAGS
  ./configure 
  make
  cp libzarith.a "$PREFIX/lib/zarith/libzarith_xen.a"
fi
