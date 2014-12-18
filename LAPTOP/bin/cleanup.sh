#!/bin/bash
find . '(' -iname '*.nfo' -o -iname '*.jpg'  -o -iname '*.JPEG'    -o -iname '*.png'  -o -iname '*.PNG'  -o -iname '*.jpeg'  -o -iname '*.JPEG'  -o -iname '*.log'  -o -iname '*.m3u'  -o -iname '*.accurip' -iname '*.nfo' -o -iname '*.tbn' -o -iname '*.txt' ')' -exec rm {} \;
