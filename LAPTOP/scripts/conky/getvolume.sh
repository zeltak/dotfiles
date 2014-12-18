#!/bin/bash
amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "Master Mute" } else { print "Master",$2"%" }}'