---
layout: docs
project: netshare
menu: docs
title: Getting Started
first-section: Overview
---

{:.no-margin-top}
## Overview

Netshare is a docker volume plugin which runs as a service on linux.  It must run on the same host as the Docker daemon since it handles mounting remote file systems and plugs into the local Docker daemon.

#### NFS Prerequisites on Linux

NFS needs to be installed on Linux systems in order to properly mount NFS mounts.  

- For Ubuntu/Debian: `sudo apt-get install -y nfs-common`
- For RHEL/CentOS: `sudo yum install -y nfs-utils`

It is recommend to try mounting an NFS volume to eliminate any configuration issues prior to running the plugin:

{:.console}
```nohighlight
sudo mount -t nfs4 1.1.1.1:/mountpoint /target/mount
```

## Installation

### Binary Installation

Binaries are available through GitHub releases.  You can download the appropriate binary, package and version from the [Releases](https://github.com/{{ site.repo-org }}/{{ site.repo-name }}/releases) page

### On Ubuntu / Debian

The method below will install the sysvinit and /etc/default options that can be overwritten during service start.

1. Install the Package

{:.console}
```nohighlight
$ wget https://github.com/{{ site.repo-org }}/{{ site.repo-name }}/releases/download/v{{ site.depcon-version }}/docker-volume-netshare_{{ site.depcon-version }}_amd64.deb
$ sudo dpkg -i docker-volume-netshare_{{ site.depcon-version }}_amd64.deb
```

2. Modify the startup options in `/etc/default/docker-volume-netshare`
3. Start the service `service docker-volume-netshare start`

### Building Source

**Pre-Requisites**

- GOLANG 1.5+
- Vendor support enabled.  You **MUST** add env variable `GO15VENDOREXPERIMENT=1` to enable

Add Depcon and its package dependencies to your go `src` directory

{:.console .command}
```
$ go get github.com/{{ site.repo-org }}/{{ site.repo-name }}
$ go build
```

Once the `get` has completed, you should find your new `docker-volume-netshare` executable sitting inside the `$GOPATH/bin/`

## Configuration

Depending on how you installed configuration can vary.  If your using your own launch scripts then you can simply launch netshare into the background along with the desired arguments / flags.

To get an idea of the possible flags or arguments you can print the usage:

{:.console}
```nohighlight
$ docker-volume-netshare -h
```

On Ubuntu/Debian installs via the deb package you can set your options in ```/etc/default/docker-volume-netshare```

{% include common-links.html %}
