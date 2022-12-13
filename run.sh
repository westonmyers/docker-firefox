#!/bin/sh
export DISPLAY=:0
export XAUTH_COOKIE=$(xauth list)
export $DISPLAY
echo $XAUTH_COOKIE
echo $XAUTHORITY
if [ "$(docker compose ps -q --status running)" ]
then
  echo "Currently running, stopping"
  docker compose stop
else
  echo "Not currently running"
fi
if [ "$(docker compose ps -q)" ]
then
  echo "Existing container, removing"
  docker compose rm -s -f
else
  echo "No existing container"
fi
xhost +local:docker
if [[ $@ != "" ]]
then
  docker compose run app $@
else
  docker compose up
fi
xhost -local:docker
