#!/bin/bash

#urxvt -name ssh_home +sb -e  ssh -R 4321:localhost:4321 zeltak@zeltak.homelinux.com

LAN=$(ip route show dev eth0 | cut -d " " -f 10 | tail -1)
WLAN=$(ip route show dev wlan0 | cut -d " " -f 10 | tail -1)


#for mosh uncomment below and comment ssh
# if [[ $LAN == 192.168.0.50 ]]
#   then 
#     #urxvt -name ssh_home +sb -e ssh -R 4321:localhost:4321 192.168.0.2
#     termite -r ssh_home -e "ssh -R 4321:localhost:4321 192.168.0.2"
# elif [[ $WLAN == 192.168.0.51 ]] 
#   then 
#     #urxvt -name ssh_home +sb -e ssh -R 4321:localhost:4321 zeltak@192.168.0.2
#     termite -r ssh_home -e "ssh -R 4321:localhost:4321 zeltak@192.168.0.2"
#   else 
#     #urxvt -name ssh_home +sb -e ssh -R 4321:localhost:4321 zeltak@zeltak.homelinux.com
#      termite -r ssh_home -e "ssh -R 4321:localhost:4321 zeltak@zeltak.homelinux.com"
# fi


#for ssh uncomment below and comment mosh
  if [[ $LAN == 192.168.0.50 ]]
    then
      #urxvt -name ssh_home +sb -e ssh -R 4321:localhost:4321 192.168.0.2
      termite -r ssh_home -e "ssh -R 4321:localhost:4321 192.168.0.2"
  elif [[ $WLAN == 192.168.0.51 ]]
    then
      #urxvt -name ssh_home +sb -e ssh -R 4321:localhost:4321 zeltak@192.168.0.2
      termite -r ssh_home -e "ssh -R 4321:localhost:4321 zeltak@192.168.0.2"
    else
      #urxvt -name ssh_home +sb -e ssh -R 4321:localhost:4321 zeltak@zeltak.homelinux.com
       termite -r ssh_home -e "ssh -R 4321:localhost:4321 zeltak@zeltak.homelinux.com"
  fi