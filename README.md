# switch-os
Seamlessly switch between host OS and guest OS using Docker :whale: .

## Current Guest/Docker OS's:
- ubuntu:16.04  
- yeban/biolinux:8

Inspired by: [oswitch](https://github.com/wurmlab/oswitch)

## Requirements
- Docker (If on Windows or Mac use [kitematic](https://kitematic.com/) or see [Docker for Mac](https://docs.docker.com/docker-for-mac/install/) or [Docker for Windows](hhttps://docs.docker.com/docker-for-windows/install/) )
- bash

## Run Ubuntu:16.04

```bash
switch-os.sh ubuntu
```

output to screen...

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

output to screen...

```
switch-os:17.05.0.1-aplha
docker run     --rm=true     --name biolinux     -v /Users/sjnewhouse:/home/sjnewhouse     -e USER=sjnewhouse -e USERID=501     -w=/home/sjnewhouse     -i -t yeban/biolinux:8 bash
Running:yeban/biolinux:8
root@4164cdb4082d:/home/sjnewhouse# 
```
