# dero-docker
[![docker](https://github.com/stratumfarm/dero-docker/actions/workflows/docker.yml/badge.svg)](https://github.com/stratumfarm/dero-docker/actions/workflows/docker.yml)

## Notes

This image will start dero (node and wallet-cli) inside a screen session. This workaround allows you to access the interactive console within the container.

### Connect to a running container

`docker exec -it $CONTAINER_NAME screen -rd dero`

### Disconnect from a container

`ctrl+a d` -> **never** use `ctrl+c` or `exit` since this will stop the dero process but keep the container running (which is bad)