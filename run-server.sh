#!/bin/bash
if [ $# -ne 1 ]; then
	echo "usage: $0 path/to/world"
	exit 1
fi
nerdctl run -ti --rm -p 25565:25565 -v "$1":/app/world:rw localhost/minecraft-server:latest
