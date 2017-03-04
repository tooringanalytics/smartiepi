#!/bin/sh
filename=`./gettube.sh $1`
echo $filename
omxplayer -r -b -o hdmi "$filename"

