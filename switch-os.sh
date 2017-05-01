#!/usr/bin/env bash
# OS Switcher
# Run Docker based OS on Host OS
# Inspired by: https://github.com/wurmlab/oswitch

VERSION="17.05.0.1-alpha" ## YY.MM.VV
AUTHOR="Stephen Newhouse <stephen.j.newhouse@gmail.com>"

# select Docker OS
if [[ "${1}" == "list" ]]; then
    echo -e "
    ------------------------
    [switch-os ]: Seamlessly switch between Os's using Docker
    [Version   ]: ${VERSION}
    ------------------------
    Available OS's:
     - ubuntu:16.04     [Usage: switch-os.sh ubuntu   ]
     - yeban/biolinux:8 [Usage: switch-os.sh biolinux ]\n"
     exit 1
elif [[ "${1}" == "ubuntu" ]]; then
    DOCKER_OS="ubuntu:16.04"
elif [[ "${1}" == "biolinux" ]]; then
    DOCKER_OS="yeban/biolinux:8"
fi

# run selected Docker OS
CMD="docker run \
    --rm=true \
    --name ${1} \
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
