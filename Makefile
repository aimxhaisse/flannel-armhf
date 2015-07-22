.PHONY: all make-binary

all: make-binary

make-binary:
	docker build -t make-binary-flannel make-binary

