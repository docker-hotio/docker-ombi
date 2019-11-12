# ombi

[![GitHub](https://img.shields.io/badge/source-github-lightgrey)](https://github.com/hotio/docker-ombi)
[![Docker Pulls](https://img.shields.io/docker/pulls/hotio/ombi)](https://hub.docker.com/r/hotio/ombi)

## Starting the container

Just the basics to get the container running:

```shell
docker run --rm --name ombi -p 5000:5000 -v /tmp/ombi:/config -e TZ=Etc/UTC hotio/ombi
```

The environment variables below are all optional, the values you see are the defaults.

```shell
-e PUID=1000
-e PGID=1000
-e UMASK=022
```

## Tags

| Tag      | Description                       | Build Status                                                                                                                                        |
| ---------|-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| latest   | The same as `stable`              |                                                                                                                                                     |
| stable   | Stable version                    | [![Build Status](https://cloud.drone.io/api/badges/hotio/docker-ombi/status.svg?ref=refs/heads/stable)](https://cloud.drone.io/hotio/docker-ombi)   |
| unstable | Unstable version, AppVeyor builds | [![Build Status](https://cloud.drone.io/api/badges/hotio/docker-ombi/status.svg?ref=refs/heads/unstable)](https://cloud.drone.io/hotio/docker-ombi) |

You can also find tags that reference a commit or version number.

## Executing your own scripts

If you have a need to do additional stuff when the container starts or stops, you can mount your script with `-v /docker/host/my-script.sh:/etc/cont-init.d/99-my-script` to execute your script on container start or `-v /docker/host/my-script.sh:/etc/cont-finish.d/99-my-script` to execute it when the container stops. An example script can be seen below.

```shell
#!/usr/bin/with-contenv bash

echo "Hello, this is me, your script."
```
