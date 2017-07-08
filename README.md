# switch-os
Seamlessly switch between host OS and guest OS using [Docker](https://www.docker.com/what-docker) :whale: .

**VERSION=17.07.v0.1**  
**AUTHOR=Stephen Newhouse <stephen.j.newhouse@gmail.com>**  

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
- sets Docker WORKDIR to `/home/$USER`

## Usage

     Usage:
            switch-os.sh <REPOSITORY:TAG> <true|false>
            

            <true|false>: The second flag sets the option to remove the
            container on exit. Set this to false if you make changes to the 
            running image and wish to commit the changes for future use.
            
      List Images:
      
            switch-os.sh list      

**The `docker run` command**
```bash
# run selected Docker OS
CMD="docker run --rm=${2} \
    --name ${NAME}_$(date +%y%m%d%M) \
    -v ${HOME}:/home/${USER} \
    -e USER=${USER} \
    -e USERID=${UID} \
    -w=/home/${USER} \
    -i -t ${DOCKER_OS} bash"
```


## Example: Run Ubuntu:16.04

```bash
switch-os.sh ubuntu true
```

example output to screen (on my local macbook-pro):

```
switch-os:17.07.v0.1
------------------------
Running:
Setting Container UID: 501
Setting Container USER: sjnewhouse
Mounting HOST Volume /Users/sjnewhouse to Container Volume: /home/sjnewhouse
Setting Container WORKDIR: /home/sjnewhouse
Remove Container on Exit (--rm=true|false): true
docker run --rm=true     --name ubuntu_16.04_17070804     -v /Users/sjnewhouse:/home/sjnewhouse     -e USER=sjnewhouse     -e USERID=501     -w=/home/sjnewhouse     -i -t  bash
```
