#!/bin/bash
date | while read i; do notify-send "$i"; done &&
acpi | while read i; do notify-send "$i"; done
