#!/bin/bash
SOURCE_FILE="/etc/passwd"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
NORMAL="\e[0m"
USAGE(){
    echo -e "USAGE: $basename $0 -n <name> -w <wishes>\n"
    echo "options"
    echo "-n (mandtaory)"
    echo "-w (mandatory)"
}
while getopts "n:w:h" option; do
  case $option in
    n)
      NAME=$OPTARG
      ;;
    w)
      WISHES=$OPTARG
      ;;
    h)
      USAGE
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      USAGE
      exit 1
      ;;
  esac
done
echo "Hello $NAME  $WISHES"