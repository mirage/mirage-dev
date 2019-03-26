bash .travis-ocaml.sh

export OPAMYES=1
eval $(opam config env)

opam repo add mirage-dev .
opam update -u

opam depext -uiy mirage

git clone git://github.com/TheLortex/mirage-skeleton
cd mirage-skeleton
git checkout dune-fix
make MODE=${MODE}

