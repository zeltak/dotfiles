#HDF original files are copied into separate folders by year
#before extracting using Metlab
#Jul 8, 2013

import os
import shutil
import time
from time import gmtime, strftime
 
for i in range(2000, 2013):    
    tm = strftime("%H:%M on %a, %b %d")
    start_time = time.time()
    print "Year of " + str(i) + " - Starts at " + str(tm)

    for f in os.listdir('H:/Satelite Images'):
        if f[16:20] == str(i):
            shutil.copy2('H:/Satelite Images/' + str(f), 'H:/MIAC_USA/' + str(i))

print "End!"
