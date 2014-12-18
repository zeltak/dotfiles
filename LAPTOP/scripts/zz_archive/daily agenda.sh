#!/bin/bash
function update() # Current date, time, weather and calendar
( 
echo -e "\nHello $USER, How are you today?" 
echo -e "\nCurrent Date and Time: $NC " ; date 
echo -e "\nYour Schedule: $NC " ; gcalcli agenda head 
echo -e "\nCurrent Weather Conditons: $NC " ; weather head -n 7 
echo ""
