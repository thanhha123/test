#!/bin/bash
# add backport sources to the end of the file
echo "deb http://ftp.us.debian.org/debian/ stretch-backports main" >> /etc/apt/sources.list
echo "deb-src http://ftp.us.debian.org/debian/ stretch-backports main" >> /etc/apt/sources.list
# update apt & install kernel 4.16
apt-get update ; apt-get install -t stretch-backports linux-image-amd64
