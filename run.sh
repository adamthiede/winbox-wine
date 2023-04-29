#!/bin/bash

command -v docker && CMD='docker'
command -v podman && CMD='podman'
command -v $CMD || exit 1

$CMD build . -t winebox:0.1

$CMD run \
	--net=host \
	--privileged \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
	-e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
	-v $HOME/.Xauthority:/home/user/.Xauthority:ro \
	-v /dev/shm:/dev/shm \
	--device /dev/video0 \
	--name winebox \
	--rm \
	winebox:0.1

