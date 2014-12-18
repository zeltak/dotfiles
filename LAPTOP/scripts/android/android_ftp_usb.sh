#!/bin/bash
MNTDIR=/home/zeltak/mounts/sg3
USER=zeltak
PASS=
FTPPORT=2221
PASSIVEPORTS="2222 2223 2224"

  if grep -qs "${MNTDIR}" /proc/mounts; then
    fusermount -u ${MNTDIR}
    killall adb
  else
    adb start-server 
    for i in $PASSIVEPORTS; do adb forward tcp:$i tcp:$i; done
    adb forward tcp:$FTPPORT tcp:$FTPPORT 
    curlftpfs "$USER":"$PASS"@127.0.0.1:$FTPPORT ${MNTDIR}
  fi
