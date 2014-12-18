#!/bin/bash

MemTotal=0
MemAvailable=0

while read name amount unit; do
  if [[ $name == "MemTotal:" ]]; then
    MemTotal=$amount
  elif [[ $name == "MemAvailable:" ]]; then
    MemAvailable=$amount
  fi
done < /proc/meminfo
echo $(( (MemTotal-MemAvailable)*100/MemTotal ))
