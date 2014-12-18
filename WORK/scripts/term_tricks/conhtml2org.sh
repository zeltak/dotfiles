#!/bin/bash
for a in *.html; do iconv -f utf-8//TRANSLIT -t utf-8 "$a" > "a" ; 
for a in *.html; do pandoc -s -S "$a" -o "${a%.html}.org" ; done  
