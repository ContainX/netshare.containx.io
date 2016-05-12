---
layout: docs
project: netshare
menu: docs
title: NFS v3/4
first-section: Overview
---

{:.no-margin-top}
## Overview

Before we get started on using Netshare with NFS filesystems make sure you installed the prerequisites as noted in the Getting Started guide.

#### NFS Prerequisites on Linux

NFS needs to be installed on Linux systems in order to properly mount NFS mounts.  

- For Ubuntu/Debian: `sudo apt-get install -y nfs-common`
- For RHEL/CentOS: `sudo yum install -y nfs-utils`

It is recommend to try mounting an NFS volume to eliminate any configuration issues prior to running the plugin:

{:.console}
```nohighlight
sudo mount -t nfs4 1.1.1.1:/mountpoint /target/mount
```

## Usage

If you have installed Netshare as a deb package then make sure the service is running.  If you are simply playing with the driver to evaluate, you can open a separate terminal window and run in the foreground:

{:.console}
```nohighlight
$ sudo docker-volume-netshare nfs
```

#### Launching a Container

For this example we'll run an Ubuntu container and mount a remote share into a ```/data``` directory within the container:

{:.console}
```nohighlight
$ docker run -i -t --volume-driver=nfs -v nfshost/path:/data ubuntu /bin/bash

root@3ff00e59c734:/$ ls /data
```

#### Creating a volume with Docker volume

You can also create named volumes using the ```docker volume``` syntax. To do this we must use the ```share``` option.

{:.console}
```nohighlight
$ docker volume create -d nfs --name myvol -o share=nfshost:/share
$ docker run -it --rm -v myvol:/data ubuntu bash
```

#### Using with Docker Compose v2

To mount volumes during compose orchestration you must define the volume in the YML.  

**docker-compose.yml**

```
version: '2'

volumes:
  data:
    driver: nfs
    driver_opts:
      share: host:/share

services:
  hello:
    image: alpine
    volumes:
      - data:/mnt
    command: ls /mnt
```

## Advanced options

There may be specific NFS settings that aren't handled out of the box.  One example may be a different port number for the NFS server.  To pass through custom ```mount options```.

Globally on launch:

{:.console}
```nohighlight
$ docker-volume-netshare nfs -o port=2049,sec=ntlm
```

As a named volume:

{:.console}
```nohighlight
$ docker volume create -d nfs --name myvol -o share=myserver:/share -o port=2049
```

{% include common-links.html %}
