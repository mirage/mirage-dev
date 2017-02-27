bash .travis-ocaml.sh

export OPAMYES=1
eval $(opam config env)

opam repo add mirage-dev .
opam update -u
opam install mirage

git clone git://github.com/mirage/mirage-skeleton
cd mirage-skeleton
make MODE=${MODE}

opam install -y -j2 datakit-ci datakit-server datakit-github datakit-client logs-syslog
