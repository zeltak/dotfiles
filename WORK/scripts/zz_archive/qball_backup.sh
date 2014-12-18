#!/bin/bash

ITEMS="qball  websites"
DATE=`date +%d-%m-%Y-%H%M`
WEEK=`date +%Y-%W`
BBPATH="/media/cdrom0/BackupServer/$WEEK"

mount -t smbfs //192.150.0.20/OpenShare /media/cdrom0/ -o password=""

if [ ! -d "/media/cdrom0/BackupServer/" ]
then
        echo "Failed to find backup directory";
        exit 0;
fi

if [ ! -d "${BBPATH}"  ] ;
then
        echo "Create directory: ${BBPATH}";
        mkdir "${BBPATH}";
fi

for a in ${ITEMS}; do
        tar -pczv --file /${BBPATH}/${a}-${DATE}.tar.gz --listed-incremental /${BBPATH}/${a}.incr /home/${a}
done

umount /media/cdrom0/