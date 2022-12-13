# docker-firefox: Containerized Firefox

## Requirements:
`docker`, `docker-compose`, `xorg-xhost`

## Instructions:
`./run.sh` - Start Firefox
`./run.sh command` - Start `$command` within Firefox's Docker container. e.g. - `./run.sh bash` and `./run.sh bash -c "/opt/firefox/firefox-bin"`

You can change the version of Firefox via the `firefox_version` variable at the top of the `Dockerfile`

Your Firefox session has permanence due to `./user_home-firefox/` being passed into the container. You can change this in the `docker-compose.yml` file if you wish.
