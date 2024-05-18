#!/bin/bash

rows=500
columns=6

# It looks like positions are in y,z,x or x,z,y position. God knows why?

ypos=-111
zpos=16.2554466247559
xpos=248

xpos_offset="+ 0"
ypos_offset="+ 4"
zpos_offset="+ 0"

second_xpos=$xpos
second_ypos=$ypos
second_zpos=$zpos

second_xpos_offset="+ 2"
second_ypos_offset="+ 0"
second_zpos_offset="+ 0"

for i in $( seq 1 $columns )
do
  for i in $( seq 1 $rows )
  do
    guid=$(cat /proc/sys/kernel/random/uuid)
    echo "	Scenarios.Data.ScnProp
	{
		propName = Platforms.Ramps.RampFlat2x1
		visibleInStage = -1
		persistAfterMissionEnd = True
		scale = 1,1,1
		absPos = $xpos,$zpos,$ypos
		rotation = 0,0.5,0,0.5
		guid = $guid
	}"
    xpos=`echo $xpos $xpos_offset | bc`
    ypos=`echo $ypos $ypos_offset | bc`
    zpos=`echo $zpos $zpos_offset | bc`
  done
  # Set offset and then reset the second for loop to new starting postition
  second_xpos=`echo $second_xpos $second_xpos_offset | bc`
  xpos=$second_xpos
  second_ypos=`echo $second_ypos $second_ypos_offset | bc`
  ypos=$second_ypos
  second_zpos=`echo $second_zpos $second_zpos_offset | bc`
  zpos=$second_zpos
done
