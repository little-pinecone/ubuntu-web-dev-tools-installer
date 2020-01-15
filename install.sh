#!/bin/bash

set -e

source ./scripts/support/debug.sh
source ./scripts/support/colours.sh
source ./scripts/support/options.sh

while getopts thv option; do
  case "${option}" in
  t)
    test=true
    ;;
  h)
    source ./scripts/support/help.sh
    exit 0
    ;;
  v)
    verify_only=true
    ;;
  *)
    echo "$red Unknown option used. Type './install.sh -h' to see the available options. $reset_colour
    "
    exit 1
    ;;
  esac
done
shift $((OPTIND - 1))

tools=$@

if [ "$verify_only" != true ]; then
  echo "$light_blue The following tools will be installed: $tools. Would you like to continue?: y/n (y) $reset_colour"
  read -r confirmation
  if [ "$confirmation" = y ] || [ -z "$confirmation" ]; then
    #sudo apt update -y
    for file in $tools; do
      if [ -e ./scripts/tools/"$file"_verify.sh ]; then
        source ./scripts/tools/"$file".sh
      else
        echo "$red Installation script not found for: $file. $reset_colour"
        echo ""
      fi
    done
  fi
fi

source ./scripts/support/verify_installation.sh

echo ""
echo "$gray END OF THE install_tools.sh SCRIPT. $reset_colour"
