#!/bin/sh -ex
PREFIX=`opam config var prefix`
PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"
export PKG_CONFIG_PATH

make install
mkdir -p "$PREFIX/lib/pkgconfig"
cp gmp-xen.pc "$PREFIX/lib/pkgconfig/"
mkdir -p "$PREFIX/lib/gmp-xen"
cp .libs/libgmp.a "$PREFIX/lib/gmp-xen/libgmp-xen.a"
