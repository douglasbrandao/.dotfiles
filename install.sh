#!/bin/bash

file=$(head -n 1 /etc/lsb-release)

IFS='='

read -a strarr <<< "$file"

distro_name=${strarr[1]}

if [[ $distro_name == "Ubuntu" ]]; then
  source "$(dirname $0)/install-ubuntu.sh"
elif [[ $distro_name == "Arch" ]]; then
  echo "in progress"
fi
