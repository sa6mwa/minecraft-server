.PHONY: all
all: clean build

.PHONY: clean
clean:
	rm -f Containerfile start.sh server.properties

.PHONY: build
build: Containerfile start.sh server.properties eula.txt
	nerdctl build -t localhost/minecraft-server .

Containerfile:
	gotmpl -o Containerfile values.json Containerfile.template

start.sh:
	gotmpl -o start.sh values.json start.sh.template

server.properties:
	gotmpl -o server.properties values.json server.properties.template

eula.txt:
	echo "eula=true" > eula.txt
