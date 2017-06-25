bash .travis-ocaml.sh

export OPAMYES=1
eval $(opam config env)

opam repo add mirage-dev .
opam update -u
opam depext -j3 uivy mirage mirage-dns mirage-conduit conduit-async conduit-lwt-unix tcpip

#git clone git://github.com/mirage/mirage-skeleton
#cd mirage-skeleton
#make MODE=${MODE}

