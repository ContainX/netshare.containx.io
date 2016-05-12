---
layout: docs
project: netshare
menu: docs
title: CIFS / Samba
first-section: Overview
---

{:.no-margin-top}
## Overview

Before we get started on using Netshare with CIFS/Samba filesystems make sure you have tested manually using the ```mount``` command on the hosts that will be running Docker and Netshare.


## Usage

If you have installed Netshare as a deb package then make sure the service is running.  If you are simply playing with the driver to evaluate, you can open a separate terminal window and run in the foreground:

{:.console}
```nohighlight
$ sudo docker-volume-netshare cifs
```

#### Launching a Container

For this example we'll run an Ubuntu container and mount a remote share into a ```/data``` directory within the container:

{:.console}
```nohighlight
$ docker run -it --volume-driver=cifs -v cifshost/share:/data ubuntu /bin/bash

root@3ff00e59c734:/$ ls /data
```

**Note:** In CIFS the ```//``` is omitted and handled by Netshare

#### Creating a volume with Docker volume

You can also create named volumes using the ```docker volume``` syntax. To do this we must use the ```share``` option.

{:.console}
```nohighlight
$ docker volume create -d cifs --name myvol -o share=cifs:/share -o username=user -o password=pass -o domain=domain -o security=security
$ docker run -it --rm -v myvol:/data ubuntu bash
```

#### Using with Docker Compose v2

To mount volumes during compose orchestration you must define the volume in the YML.  

**docker-compose.yml**

```
version: '2'

volumes:
  data:
    driver: cifs
    driver_opts:
      share: cifshost:/share

services:
  hello:
    image: alpine
    volumes:
      - data:/mnt
    command: ls /mnt
```

### Storing credentials in NetRC

.NetRC is fully support eliminating users and passwords to be specified in step 1. To use .netrc do the following steps:

1) Create a ```/root/.netrc``` file (since Netshare needs to be run as a root user). Add the host and credential mappings.

**Example:**

```
//.netrc
  machine some_hostname
       username  jeremy
       password  somepass
       domain    optional
       security  optional
```

2) Launch the plugin ```sudo docker-volume-netshare cifs``` or restart via systemd (preferred)

3) Launch the container

{:.console}
```nohighlight
$ docker run -it --volume-driver=cifs -v some_hostname/share:/mount ubuntu /bin/bash
```

{% include common-links.html %}
