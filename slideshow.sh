#!/bin.bash
PICTURES="/home/pi/Pictures/external"
feh -Y -x -q -D 5 -B black -F -Z -rSfilename "${PICTURES}/${1}"
