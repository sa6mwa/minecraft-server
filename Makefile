.PHONY: all
all: clean build

.PHONY: clean
clean:
	rm -f Containerfile start.sh

.PHONY: build
build: Containerfile start.sh
	nerdctl build -t localhost/minecraft-server .

Containerfile:
	gotmpl -o Containerfile values.json Containerfile.template

start.sh:
	gotmpl -o start.sh values.json start.sh.template
