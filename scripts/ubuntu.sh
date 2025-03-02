#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Modify ubuntu apt sources.list
sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list
sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

# Update the container and install packages
apt update && apt upgrade -y
grep -v '^#' ./ubuntu.packages | xargs apt install -y 