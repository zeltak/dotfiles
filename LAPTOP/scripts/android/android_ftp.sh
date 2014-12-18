#!/bin/bash
TESTDIR=/mnt/tablet

if grep -qs "${TESTDIR}" /proc/mounts; then
#        gksu umount /mnt/tablet
terminal --role=space -e "sudo umount /mnt/tablet"
else
        curlftpfs user:password@IP:PORT /mnt/tablet
fi
