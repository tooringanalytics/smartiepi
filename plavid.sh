#!/bin/sh
filename=$1
echo "Playing $filename"
omxplayer -r -b -o local "$filename"
