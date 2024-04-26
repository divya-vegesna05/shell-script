#!/bin/bash
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
NORMAL="\e[0m"
USAGE(){
    echo -e "USAGE: $(basename $0) -n <name> -w <wishes>\n"
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
if [ -z "$NAME" ] 
then
echo "error values NAME WISHES not empty"
else
echo "Hello $NAME  $WISHES"
fi