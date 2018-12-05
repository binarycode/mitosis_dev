#!/usr/bin/env bash

FLASH=false
QMK=

while true; do
  case "$1" in
    -f | --flash )
      FLASH=true
      DEVICE=$2
      shift
      ;;

    -h | --help )
      echo "Usage: ./run.sh [-f DEVICE] QMK_PATH"
      echo " -f, --flash DEVICE"
      echo "   flash the firmware to DEVICE after building"
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
  if [ ! -c "$DEVICE" ]
  then
    echo "DEVICE is not a character device"
    exit 1
  fi
  docker run --rm --device $DEVICE -v $QMK:/qmk:rw qmk make mitosis:binarycode:avrdude
else
  docker run --rm -v $QMK:/qmk:rw qmk make mitosis:binarycode
fi
