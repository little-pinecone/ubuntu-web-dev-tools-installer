#!/bin/bash

# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an exit code of the last command before exiting
trap 'echo "\"${last_command}\" - last executed command exited with code $?."' EXIT

auto=false
sudo apt update -y

while [ -n "$1" ]; do
  case "$1" in
  -guake)
    source ./scripts/guake.sh
    ;;
  -docker)
    source ./scripts/docker.sh
    ;;
  -openjdk)
    source ./scripts/openjdk.sh
    ;;
  -nodejs)
    source ./scripts/nodejs.sh
    ;;
  -angular)
    source ./scripts/angular.sh
    ;;
  -auto)
    auto=true
    ;;
  esac

  shift
done

echo "-------------------"
echo "Tools installation summary:"
echo "-------------------"
if [ "$guake" = true ]; then
  echo "Guake has been installed."
  echo "$(guake --version)"
  echo "-------------------"
fi
if [ "$docker" = true ]; then
  echo "Docker has been installed."
  echo "$(docker version)"
  echo "Docker status:"
  echo "$(sudo systemctl is-active docker)"
  if [ "$auto" != true ]; then
    echo "Would you like to run test docker container?: y/n"
    read -r decision
    if [ "$decision" = y ]; then
      echo "$(sudo docker run hello-world)"
    elif [ "$decision" = Y ]; then
      echo "$(sudo docker run hello-world)"
    fi
  fi
  echo "-------------------"
fi
if [ "$openjdk" = true ]; then
  echo "OpenJDK has been installed."
  echo "$(java -version)"
  echo "-------------------"
fi
if [ "$nodejs" = true ]; then
  echo "Node.js has been installed."
  echo "$(node --version)"
  echo "-------------------"
  echo "Npm has been installed."
  echo "$(npm --version)"
  echo "-------------------"
fi
if [ "$angular" = true ]; then
  echo "Angular has been installed."
  echo "$(ng --version)"
  echo "-------------------"
fi

echo "END OF THE install_tools.sh SCRIPT."
