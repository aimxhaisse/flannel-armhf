FROM ubuntu:vivid

MAINTAINER Sébastien Rannou <mxs@sbrk.org> (@aimxhaisse)

RUN apt-get update \
 && apt-get install -q -y \
    gcc-4.9-arm-linux-gnueabi \
    gcc \
    git

# Set environment variables.
ENV GOROOT /goroot
ENV GOPATH /gopath
ENV CGO_ENABLED 1
ENV GOARCH arm
ENV GOOS linux
ENV GOARM 7
ENV CC gcc
ENV CC_FOR_TARGET arm-linux-gnueabi-gcc-4.9
ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH

RUN git clone https://go.googlesource.com/go /goroot \
 && cd /goroot \
 && git checkout release-branch.go1.4 \
 && cd src \
 && ./make.bash || true

ENV APP $GOPATH/src/github.com/coreos/flannel
RUN git clone https://github.com/coreos/flannel.git $APP
WORKDIR $APP

RUN CC=arm-linux-gnueabi-gcc-4.9 go build -o /go/bin/flannel-Linux-armv7
