#!/bin/sh
# Usage: gettube.sh <YOUTUBE_VIDEO_ID>
# Downloads the video into /home/pi/Videos/youtube/<Uploader>/<title>-<id>.<extension>
#
youtube-dl -o \'/home/pi/Videos/youtube/\%\(uploader\)s/\%\(title\)s-\%\(id\)s.\%\(ext\)s\' $1 > /tmp/youtube-dl-op 2>&1
# cat /tmp/youtube-dl-op
cat /tmp/youtube-dl-op | grep -e '^\[download\]\ \(Destination\:\ \)\?.\(.*\).\(\ has\ already\ been\ downloaded.*\)\?$' | sed s/'\[download\]\ \(Destination\:\ \)?'//g | sed s/'\[download\]\ '//g | sed s/'\ has\ already\ been\ downloaded'//g
# | sed s/'^.'/\"/g | sed s/'.$'/\"/g | sed s/\'/\\\'/g
rm -f /tmp/youtube-dl-op
