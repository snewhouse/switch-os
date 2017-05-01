# switch-os
Seamlessly switch between host OS and guest OS using [Docker](https://www.docker.com/what-docker) :whale: .

## Current Guest/Docker OS's:
- ubuntu:16.04  
- yeban/biolinux:8

Inspired by: [oswitch](https://github.com/wurmlab/oswitch)

## Requirements
- Docker (If on Windows or Mac use [kitematic](https://kitematic.com/) or see [Docker for Mac](https://docs.docker.com/docker-for-mac/install/) or [Docker for Windows](https://docs.docker.com/docker-for-windows/install/) )
- bash

## Features
- sets Docker `UID` ENV to HOST `$UID`
- sets Docker `USER` ENV to HOST `$USER`
- mounts HOST user `$HOME` to Docker Volume `/home/$USER`

**The `docker run` command**
```bash
docker run \
    --rm=true \
    --name ${1} \
    -v ${HOME}:/home/${USER} \
    -e USER=$USER -e USERID=$UID \
    -w="/home/${USER}" \
    -i -t ${DOCKER_OS} bash"
```


## Run Ubuntu:16.04

```bash
switch-os.sh ubuntu
```

example output to screen (on my local macbook-pro):

```
switch-os:17.05.0.1-aplha
docker run     --rm=true     --name ubuntu     -v /Users/sjnewhouse:/home/sjnewhouse     -e USER=sjnewhouse -e USERID=501     -w=/home/sjnewhouse     -i -t ubuntu:16.04 bash
Running:ubuntu:16.04
root@d411cddb3656:/home/sjnewhouse# 
```

## Run biolinux:8

```bash
switch-os.sh biolinux
```

example output to screen (on my local macbook-pro):

```
switch-os:17.05.0.1-aplha
docker run     --rm=true     --name biolinux     -v /Users/sjnewhouse:/home/sjnewhouse     -e USER=sjnewhouse -e USERID=501     -w=/home/sjnewhouse     -i -t yeban/biolinux:8 bash
Running:yeban/biolinux:8
root@4164cdb4082d:/home/sjnewhouse# 
```
