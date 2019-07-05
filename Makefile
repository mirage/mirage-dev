.PHONY: init build

all: init

init:
	rm -rf /home/opam/.opam
	cp -r .opam /home/opam/.opam
	echo `opam config env`
	sudo apt-get install -qq -yy m4 pkg-config binutils
	opam config exec $(MAKE) build

build:
	$(MAKE) -C mirage-skeleton $(EXAMPLE)-build MODE=unix
	$(MAKE) -C mirage-skeleton $(EXAMPLE)-clean
	$(MAKE) -C mirage-skeleton $(EXAMPLE)-build MODE=xen
	$(MAKE) -C mirage-skeleton $(EXAMPLE)-clean
	$(MAKE) -C mirage-skeleton $(EXAMPLE)-build MODE=hvt
	$(MAKE) -C mirage-skeleton $(EXAMPLE)-clean
	$(MAKE) -C mirage-skeleton $(EXAMPLE)-build MODE=muen
	$(MAKE) -C mirage-skeleton $(EXAMPLE)-clean
	$(MAKE) -C mirage-skeleton $(EXAMPLE)-build MODE=virtio


