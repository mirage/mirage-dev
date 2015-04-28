#!/bin/sh -ex
PREFIX=`opam config var prefix`
PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"
export PKG_CONFIG_PATH

mkdir -p "$PREFIX/lib/pkgconfig"
cp gmp-xen.pc "$PREFIX/lib/pkgconfig/"

ocamlfind install gmp-xen META
cp .libs/libgmp.a "$PREFIX/lib/gmp/libgmp_xen.a"
