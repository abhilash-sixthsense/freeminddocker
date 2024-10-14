#! /bin/bash

export X11_IP=$(ifconfig en0 | grep '[i]net' | awk '$1 == "inet" {print $2}')
xhost +$X11_IP

docker run --rm \
      -v ./shared_folder:/root/shared_folder \
      -v ./.freemind:/root/.freemind/ \
      -v ~/.themes:/root/.themes:ro \
      -v ~/.fonts:/root/.fonts:ro \
      -v ~/.icons:/root/.icons:ro \
      -v /usr/share/themes:/usr/share/themes:ro \
      -v /usr/share/fonts:/usr/share/fonts:ro \
      -v /tmp/.X11-unix:/tmp/.X11-unix \
      -e DISPLAY=$DISPLAY \
      --name freemind \
      abhi-freemind 
     