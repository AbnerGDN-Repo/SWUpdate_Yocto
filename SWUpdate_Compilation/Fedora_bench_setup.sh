#!/bin/bash
#FEDORA
sudo dnf update && sudo dnf upgrade -y

sudo dnf update && sudo dnf upgrade -y

sudo dnf install -y gawk wget git diffstat unzip texinfo gcc cmake ninja-build \ 
socat cpio zstd liblz4-tool bmap-tools ca-certificates gnupg mesa-common-dev \
python3-subunit python3-jinja2 python3 python-is-python3 python3-pip python3-pexpect python3-git \
debianutils iputils-ping xz-utils libegl1-mesa libsdl1.2-dev pylint xterm chrpath build-essential

sudo dnf install lz4
sudo dnf install zstd #pzstd unzstd 
sudo dnf install rpcgen




sudo dnf -y install chrpath
sudo dnf groupinstall "Development Tools" "Development Libraries"
sudo dnf install make automake gcc gcc-c++ kernel-devel
sudo pip install kas 
sudo dnf install kicad kicad-packages3d kicad-doc




############################################## UBUNTU  ##############################################
## Install yocto packages 

#sudo apt update && sudo apt upgrade -y

#sudo apt install -y gawk wget git diffstat unzip texinfo gcc cmake ninja-build \ 
#socat cpio zstd liblz4-tool bmap-tools ca-certificates gnupg mesa-common-dev \
#python3-subunit python3-jinja2 python3 python-is-python3 python3-pip python3-pexpect python3-git \
#debianutils iputils-ping xz-utils libegl1-mesa libsdl1.2-dev pylint xterm chrpath build-essential

#####################################################################################################



#UBUNTU
#sudo apt update && sudo dnf upgrade -y
#sudo apt install -y kas 



