# For reference, this is what travis currently runs

FROM ubuntu:trusty

RUN apt-get update -qq && apt-get install wget build-essential software-properties-common -y


# Environment variables from travis
ENV OCAML_VERSION=4.07
ENV OPAM_VERSION=2.0
ENV MODE=unix
ENV OPAM_INIT=true
ENV OPAM_SWITCH=4.07.1
ENV BASE_REMOTE=git://github.com/ocaml/opam-repository
ENV UPDATE_GCC_BINUTILS=0
ENV UBUNTU_TRUSTY=0
ENV INSTALL_XQUARTZ=true
ENV TRAVIS_OS_NAME=linux

RUN wget https://raw.githubusercontent.com/ocaml/ocaml-travisci-skeleton/master/.travis-ocaml.sh
RUN apt-get install git unzip -y
RUN bash -e .travis-ocaml.sh
COPY . /src
WORKDIR /src
RUN bash -ex .travis-ci.sh
