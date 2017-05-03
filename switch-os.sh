#!/usr/bin/env bash
# OS Switcher
# Run Docker based OS on Host OS
# Inspired by: https://github.com/wurmlab/oswitch

VERSION="17.05.0.1-alpha" ## YY.MM.VV
AUTHOR="Stephen Newhouse <stephen.j.newhouse@gmail.com>"

# Function: List Docker Images
function list_docker_images() {
    docker images | sed '1d' | awk '{print "\t"$1":"$2}'
}

# select Docker OS
if [[ $# -eq 0 || "${1}" == "help" ]]; then
    echo -e "
    ------------------------------------------------
    [switch-os ]: Seamlessly switch between Os's using Docker
    [Version   ]: ${VERSION}
    [Info      ]: If a Docker images does not exist, it will be
                  pulled from Docker Hub
    ------------------------------------------------
    Available OS's:\n
     - ubuntu:16.04     [Usage: switch-os.sh ubuntu   ]
     - yeban/biolinux:8 [Usage: switch-os.sh biolinux ]\n

     Current Docker Images on your system:\n"
     list_docker_images
     echo " "
     exit 1

elif [[ "${1}" == "ubuntu" ]]; then

    DOCKER_OS="ubuntu:16.04"

elif [[ "${1}" == "biolinux" ]]; then

    DOCKER_OS="yeban/biolinux:8"

elif [[  $# -eq 1 ]]; then

    DOCKER_OS="${1}"
    echo "${DOCKER_OS}"

fi

# run selected Docker OS
CMD="docker run \
    --rm=true \
    --name GUEST_OS \
    -v ${HOME}:/home/${USER} \
    -e USER=$USER -e USERID=$UID \
    -w="/home/${USER}" \
    -i -t ${DOCKER_OS} bash"

# print to screen
echo -e "switch-os:${VERSION}
------------------------
Running:${DOCKER_OS}
Setting Container UID: ${UID}
Setting Container USER: ${USER}
Mounting HOST Volume ${HOME} to Container Volume: /home/${USER}
Setting Container WORKDIR: /home/${USER}
${CMD}"

# run it
${CMD}


