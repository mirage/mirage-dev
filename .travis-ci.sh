bash .travis-ocaml.sh

export OPAMYES=1
export OPAMVERBOSE=1
eval $(opam config env)

opam repo add mirage-dev .
opam update -u
opam install mirage

git clone -b mirage-dev git://github.com/mirage/mirage-skeleton
cd mirage-skeleton
make MODE=${MODE}

opam install vhd-format irmin
