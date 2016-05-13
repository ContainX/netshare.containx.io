---
layout: docs
project: netshare
menu: docs
title: AWS EFS
first-section: Overview
---

{:.no-margin-top}
## Overview

Netshare fully supports AWS Elastic File System (EFS).  It follows the NFS4 protocol but offers some AWS specifics in regards to resolution or shares.

#### NFS Prerequisites on Linux

NFS needs to be installed on Linux systems in order to properly mount EFS mounts.  

- For Ubuntu/Debian: `sudo apt-get install -y nfs-common`
- For RHEL/CentOS: `sudo yum install -y nfs-utils`

## Usage

If you have installed Netshare as a deb package then make sure the service is running.  If you are simply playing with the driver to evaluate, you can open a separate terminal window and run in the foreground:

**With File System ID resolution to AZ / Region URI**

{:.console}
```nohighlight
$ sudo docker-volume-netshare efs
```

** For VPCs without AWS DNS - using IP for Mount**

{:.console}
```nohighlight
$ sudo docker-volume-netshare efs --noresolve
```


#### Launching a Container

For this example we'll run an Ubuntu container and mount a remote share into a ```/data``` directory within the container:

**With File System ID resolution to AZ / Region URI**

{:.console}
```nohighlight
$ docker run -i -t --volume-driver=efs -v fs-2324532:/data ubuntu /bin/bash

root@3ff00e59c734:/$ ls /data
```

**Launching a container using the IP Address of the EFS mount point (--noresolve flag in plugin)**

{:.console}
```nohighlight
$ docker run -i -t --volume-driver=efs -v 10.2.3.1:/data ubuntu /bin/bash

root@3ff00e59c734:/$ ls /data
```

{% include common-links.html %}
