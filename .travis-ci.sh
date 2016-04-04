bash -ex .travis-opam.sh

export OPAMYES=1

opam init git://github.com/ocaml/opam-repository >/dev/null 2>&1
opam repo add mirage-dev .
opam update -u

TARGETS="mirage-http mirage mirage-xen github dns tls mirage-profile"
opam install ${TARGETS}
eval `opam config env`
cd mirage-skeleton
make configure
make build
make clean
make configure MODE=xen
make build MODE=xen
