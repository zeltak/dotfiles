#! /bin/sh

# Script created by blackgr [ http://ubuntuforums.org/member.php?u=732179 ]
# originally downloaded from this webpage: [http://ubuntuforums.org/showpost.php?p=6700382&postcount=66 ]
# (in case you care or need someone to complain to) mirrored and distributed here http://www.stefanoforenza.com/solve-your-no_pubkey-ppas-in-a-snap-or-a-script
# License: unknown (my educated guess is it's in the Public Domain)

if [ "`whoami`" != "root" ];
then
echo "Please run with SUDO"
exit 1
fi
RELEASE=`cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d"=" -f2`
echo Release: $RELEASE
echo Please Wait...
for q in `find /etc/apt/ -name *.list`; do
cat $q >> fullsourceslist
done
for i in `cat fullsourceslist | grep "deb http" | grep ppa.launchpad | grep $RELEASE | cut -d/ -f4`; do
	wget -q --no-check-certificate `wget -q --no-check-certificate https://launchpad.net/~$i/+archive -O- | grep "http://keyserver.ubuntu.com:11371/pks/" | cut -d'"' -f2 ` -O- | grep "pub  " | cut -d'"' -f2 >> keyss
done
for j in `cat keyss` ; do
	wget -q --no-check-certificate "http://keyserver.ubuntu.com:11371$j" -O- | grep -B 999999 END |grep -A 999999 BEGIN > keyss2
	sudo apt-key add keyss2
	rm keyss2
done
rm keyss
rm fullsourceslist

