#!/bin/bash
MUSIC="/media/pi/EXTERNAL/pimusic"
PLAYLIST_FILE="/tmp/playlist.current"

play_music () {
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    mp3info -p "\t%t\r\n" "$1"
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    mp3info -p "Artist: %a\r\n" "$1"
    mp3info -p "Album: %l\r\n" "$1"
    mp3info -p "Length: %m min\r\n" "$1"
    echo "File: $1"
    echo ""
    echo ""
    # omxplayer -o local "$1"
}

rm -f $PLAYLIST_FILE

find ${MUSIC} -regextype posix-extended -regex "$1" | sort -R >> ${PLAYLIST_FILE}

while read -r line
do
    play_music "${line}"
done < "${PLAYLIST_FILE}"
rm ${PLAYLIST_FILE}
