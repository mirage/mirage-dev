bash .travis-ocaml.sh

export OPAMYES=1
eval $(opam config env)

opam repo add mirage-dev .
opam update -u

opam depext -uiy mirage duniverse

git clone -b dune-fix git://github.com/TheLortex/mirage-skeleton
make MODE=${MODE}

