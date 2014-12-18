#!/bin/bash
     for i in 96x96 72x72 64x64 48x48 32x32 24x24 22x22 16x16; do 
     cp -a 128x128 $i 
     find $i -name "*.png" -execdir mogrify -resize $i "{}" \; 
     done