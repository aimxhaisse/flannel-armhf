.PHONY: all make-binary

all: flannel-armhf

flannel-armhf: make-binary/Dockerfile
	docker build -t make-binary-flannel make-binary
	docker run --rm make-binary-flannel cat /go/bin/flannel-Linux-armv7 > $@
	chmod +x $@

