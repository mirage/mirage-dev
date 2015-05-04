#!/bin/sh -ex
PREFIX=`opam config var prefix`
PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"
export PKG_CONFIG_PATH

make install -C unix
mkdir -p "$PREFIX/lib/pkgconfig"
cp gmp-xen.pc "$PREFIX/lib/pkgconfig/"

ocamlfind install gmp META

if pkg-config --exists mirage-xen; then
  cp xen/.libs/libgmp.a "$PREFIX/lib/gmp-xen/libgmp_xen.a"
fi
