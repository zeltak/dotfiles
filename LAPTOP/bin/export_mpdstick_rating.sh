#!/usr/bin/env python

from __future__ import print_function
import os
import re
from mpd import MPDClient

client=MPDClient()

client.connect('localhost', '6600')
#client.password('mpd_access')
music_path = '/home/zeltak/music/'

class bcolors:
    HEADER = '\033[95m'
    WARNING = '\033[93m'
    ENDC = '\033[0m'

list = client.sticker_find('song', '/', 'rating')

for rate in list:
    path = rate['file']
    rating = rate['sticker'][rate['sticker'].find("=") + 1 :]
    dirname = os.path.dirname(path)
    filename = os.path.basename(path)
    f = open(music_path + dirname + "/track.ratings",'a')
    f.write(rating + "\\" + filename + '\n')
    f.close()
    print(bcolors.HEADER + rating + "\\" + filename, bcolors.ENDC + "written to", bcolors.WARNING + music_path + dirname + "/track.ratings")
