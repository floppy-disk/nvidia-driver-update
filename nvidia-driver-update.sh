#!/bin/bash

############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "This script helps install the correct NVIDIA drivers and software on a headless Ubuntu 20.04+ server."
   echo
   echo "Syntax: ./nvidia.sh [version]"
   echo "Example: ./nvidia.sh 535"
   echo
}

############################################################
############################################################
# Main program                                             #
############################################################
############################################################

Help
color()(set -o pipefail;"$@" 2> >(sed $'s,.*,\e[31m&\e[m,'>&2))
export -f color

if ! [[ "$1" =~ ^[0-9]+$ ]]
    then
        echo "ERROR: This needs to be an integer"
	echo "Reference: https://www.nvidia.com/en-us/drivers/unix/"
	echo
    else
        echo "apt install linux-headers-$(uname -r) -y";
        echo "apt autoremove -y";
        echo "apt install nvidia-headless-$1-server nvidia-utils-$1-server libnvidia-encode-$1-server -y";
fi