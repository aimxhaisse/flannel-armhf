.PHONY: all make-binary

all: docker-flannel-armhf

flannel-armhf: make-binary/Dockerfile
	docker build -t make-binary-flannel make-binary
	docker run --rm make-binary-flannel cat /go/bin/flannel-Linux-armv7 > $@
	chmod +x $@

docker-flannel-armhf: flannel-armhf
	cp flannel-armhf make-docker/flannel-armhf
	docker build -t armbuild/flannel make-docker
