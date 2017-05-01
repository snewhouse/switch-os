# switch-os
Seamlessly switch between host OS and guest OS using Docker.

Inspired by: [oswitch](https://github.com/wurmlab/oswitch)

## Run Ubuntu:16.04

```bash
switch-os.sh ubuntu
```

output to screen...

```
switch-os:17.05.0.1-aplha
docker run     --rm=true     --name ubuntu     -v /Users/sjnewhouse:/home/sjnewhouse     -e USER=sjnewhouse -e USERID=501     -w=/home/sjnewhouse     -i -t ubuntu:16.04 bash
Running:ubuntu:16.04

```


## Run biolinux:8

```bash
switch-os.sh biolinux
```
