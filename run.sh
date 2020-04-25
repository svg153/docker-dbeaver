#!/bin/bash

docker build -f Dockerfile --tag dbeaver .

DIS=`sudo ifconfig docker0 | grep "inet addr" | cut -d ':' -f 2 | cut -d ' ' -f 1`

echo ${DIS}
docker run -ti --rm \
	-v ~/:/root/ \
	--privileged \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=${DIS}:1.0 \
	--name dbeaver-i \
	dbeaver
