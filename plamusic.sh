#!/bin/bash
MUSIC="/home/pi/Music/external/"
PLAYLIST_FILE="/tmp/playlist.current"
if [ -z "${AUDIO_OUT}" ]; then
    AUDIO_OUT="alsa"
fi
function print_song_info {
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    mp3info -p "\t%t\r\n" "$1" 2>/dev/null
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    mp3info -p "Artist: %a\r\n" "$1" 2>/dev/null
    mp3info -p "Album: %l\r\n" "$1" 2>/dev/null
    mp3info -p "Length: %m min %s sec\r\n" "$1" 2>/dev/null
    echo "File: $@"
}

function play_song {
    cmd="omxplayer -o ${AUDIO_OUT} \"$@\" > /dev/null 2>&1"
    echo "Cmd: ${cmd}"
    echo "Press 'q' to skip to the next song..."
    trap "echo \"Exiting(INT)...\"; exit 255" INT
    trap '' EXIT
    trap "echo \"Exiting(SIGBUS)...\"; exit 255" SIGBUS
    trap "echo \"Exiting(SIGABRT)...\"; exit 255" SIGABRT
    trap "echo \"Exiting(SIGSEGV)...\"; exit 255" SIGSEGV
    trap "echo \"Exiting(SIGPIPE)...\"; exit 255" SIGPIPE
    trap "echo \"Exiting(TERM)...\"; exit 255" TERM

    omxplayer -o "${AUDIO_OUT}" "$@" > /dev/null 2>&1

    # trap SIGBUS SIGABRT SIGSEGV SIGPIPE TERM EXIT INT
}

rm -f $PLAYLIST_FILE

find "${MUSIC}" -regextype posix-extended -regex "$1" | shuf >> ${PLAYLIST_FILE}

mapfile -t songs < ${PLAYLIST_FILE}
num_songs=${#songs[*]}
echo "Songs in playlist: ${num_songs}"
for (( i=0; i<=$(( $num_songs - 1 )); i++ )); do
    filename="${songs[$i]}"
    print_song_info "${filename}"
    play_song "${filename}"
    echo ""
    echo ""
done

rm ${PLAYLIST_FILE}
