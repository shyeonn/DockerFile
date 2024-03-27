#!/bin/sh
HDD_PATH=/mnt/hdd0/work/sanghyeon

docker run --runtime=nvidia --privileged --gpus all -it --rm\
           --volume=$HOME:$HOME \
		   --volume=$HDD_PATH:/home/hdd \
           --net=host \
		   cuda12_sh \
           bash

#		   --group-add=$(id -g) \
#		   --user $(id -u):$(id -g) \
#		   --volume=/etc/passwd:/etc/passwd:ro \
#		   --volume=/etc/group:/etc/group:ro \
