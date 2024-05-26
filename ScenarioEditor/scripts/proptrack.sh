#!/bin/bash

# Notes
# 30 Degrees
  # rotation = 0,0,0.25,1
# -30 Degrees (I think)
  # rotation = 0,0,-0.25,1
# 45 Degrees
  # rotation = 0,0,0.25,0.5
# 0 Degrees (flat)
  # rotation = 0,0,0,0.5
# Rotated 90 Z but flat
  # rotation = 0,0.7,0,0.7
# Rotated 180 Z but flat
  # rotation = 0,0,0,1
# Rotated 270 Z but flat
  # rotation = 0,-0.7,0,0.7
# Rotaated Straight up
  # rotation = 0.5,0.5,0.5,0.5
# Rotated straight up (opposite)
  # rotation = -0.5,0.5,-0.5,0.5

propName="Platforms.Ramps.RampFlat2x1"

rows=20
columns=1

xpos=244
ypos=21.6004810333252
zpos=-24.3616638183594

xpos_offset="- 2"
ypos_offset="+ 0"
zpos_offset="+ 0"

rotation="0.5,0.5,0.5,0.5"

# Do not update these
second_xpos=$xpos
second_ypos=$ypos
second_zpos=$zpos

second_xpos_offset="+ 0"
second_ypos_offset="+ 0"
second_zpos_offset="- 2"

for i in $( seq 1 $columns )
do
  for i in $( seq 1 $rows )
  do
    guid=$(cat /proc/sys/kernel/random/uuid)
echo "	Scenarios.Data.ScnProp
	{
		propName = $propName
		visibleInStage = -1
		persistAfterMissionEnd = True
		scale = 1,1,1
		absPos = $xpos,$ypos,$zpos
		rotation = $rotation
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
