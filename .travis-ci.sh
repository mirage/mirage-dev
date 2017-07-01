bash .travis-ocaml.sh

export OPAMYES=1
eval $(opam config env)

opam repo add mirage-dev .
opam update -u
export OPAMBUILDTEST=1
opam depext -j2 -uiy mirage mirage-dns mirage-conduit conduit-async conduit-lwt-unix tcpip cohttp-async cohttp-lwt-jsoo cohttp-lwt-unix cohttp-top

#git clone git://github.com/mirage/mirage-skeleton
#cd mirage-skeleton
#make MODE=${MODE}

