#!/usr/bin/env bash

FLASH=false
QMK=

while true; do
  case "$1" in
    -f | --flash )
      FLASH=true
      shift
      ;;

    -h | --help )
      echo "Usage: ./run.sh [-f DEVICE] QMK_PATH"
      echo " -f, --flash"
      echo "   flash the firmware after building"
      echo
      echo " QMK_PATH"
      echo "   path to QMK firmware repository"
      exit 0
      ;;

    * )
      QMK=$1
      break
      ;;
  esac
done

if [ -z "$QMK" ]
then
  echo "QMK_PATH is empty"
  exit 1
fi

if [ ! -d "$QMK" ]
then
  echo "QMK_PATH is not a directory"
  exit 1
fi

if [ "$FLASH" = true ]
then
  docker run --rm --privileged -v /dev/:/dev/ -v $QMK:/qmk:rw qmk make mitosis:binarycode:avrdude
else
  docker run --rm -v $QMK:/qmk:rw qmk make clean mitosis:binarycode
fi
