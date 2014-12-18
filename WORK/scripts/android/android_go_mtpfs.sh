#!/bin/bash
MNTDIR=/home/carnager/Android

  if grep "${MNTDIR}" /proc/mounts; then
    fusermount -u ${MNTDIR}
  else
  go-mtpfs "$MNTDIR"
  fi


