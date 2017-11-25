#!/usr/bin/env bash
# OS Switcher
# Run Docker based OS on Host OS
# Inspired by: https://github.com/wurmlab/oswitch

VERSION="17.07.v0.1" ## YY.MM.VV
AUTHOR="Stephen Newhouse <stephen.j.newhouse@gmail.com>"

# select Docker OS
if [[ $# -eq 0 ]]; then
    echo -e "
    ------------------------------------------------------------
    [switch-os ]: Seamlessly switch between Os's using Docker
    [Version   ]: ${VERSION}
    ------------------------------------------------------------

    Available OS's:
     - ubuntu:16.04     [ubuntu]
     - yeban/biolinux:8 [biolinux]

     To use any other image on your machine, just provide <REPOSITORY:TAG>
     If image is not already on your system, Docker will pull it from
     Docker Hub, if its available.

     See Usage below.

     Usage:
            switch-os.sh <REPOSITORY:TAG> <true|false>

            <true|false>: The second flag sets the option to remove the
            container on exit.
            Set this to false if you make changes to the running image
            and wish to commit the changes for future use.

     List Images:

            switch-os.sh list

     eg:
     
        switch-os.sh ubuntu true \n
        switch-os.sh ubuntu:16.04-v0.0.1 false\n
     ------------------------------------------------------------"
     exit 1
elif [[ "${1}" == "list" ]]; then
    docker images
    exit 1
elif [[ $# -gt 1 ]]; then
    DOCKER_OS="${1}"
elif [[ "${1}" == "ubuntu" ]]; then
    DOCKER_OS="ubuntu:16.04"
elif [[ "${1}" == "biolinux" ]]; then
    DOCKER_OS="yeban/biolinux:8"
fi

# set container base name to rep_tag
NAME=$(echo ${1} | sed s/:/_/g )

# run selected Docker OS
CMD="docker run --rm=${2} \
    --name ${NAME}_$(date +%y%m%d%M) \
    -v ${HOME}:/home/${USER} \
    -e USER=${USER} \
    -e USERID=${UID} \
    -w=/home/${USER} \
    -i -t ${DOCKER_OS} /bin/bash"

# print to screen
echo -e "switch-os:${VERSION}
------------------------
Running:${DOCKER_OS}
Setting Container UID: ${UID}
Setting Container USER: ${USER}
Mounting HOST Volume ${HOME} to Container Volume: /home/${USER}
Setting Container WORKDIR: /home/${USER}
Remove Container on Exit (--rm=true|false): ${2}
${CMD}"

# run it
${CMD}
