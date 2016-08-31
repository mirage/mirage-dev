# Install OCaml and OPAM PPAs
case "$OCAML_VERSION" in
  4.02) ppa=avsm/ocaml42+opam12 ;;
  *) echo Unknown $OCAML_VERSION; exit 1 ;;
esac

echo "yes" | sudo add-apt-repository ppa:$ppa
sudo apt-get update -qq
sudo apt-get install -qq ocaml ocaml-native-compilers camlp4-extra opam time libgmp-dev

TRUSTY="deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe"
sudo add-apt-repository "${TRUSTY}"
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get -qq update
sudo apt-get -qq install gcc-4.8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 90
sudo add-apt-repository -r "${TRUSTY}"

echo OCaml version
ocaml -version

export OPAMYES=1

opam init git://github.com/ocaml/opam-repository >/dev/null 2>&1
opam repo add mirage-dev .
opam update -u

opam install mirage
eval `opam config env`
git clone -b better-errors git://github.com/talex5/mirage-skeleton.git
cd mirage-skeleton
MODE=unix make
MODE=xen make
