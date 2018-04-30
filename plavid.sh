#!/bin/bash
filename=$1
filedir=$(dirname "${filename}")
subtitles=(`ls ${filedir}/*.srt 2>/dev/null`)
subtitle="${subtitle[0]}"
if [ -z "${AUDIO_OUT}" ]; then
    AUDIO_OUT="alsa"
fi;
if [ -z "${subtitle}" ]; then
    echo "Playing $filename"
    omxplayer -r -b -o "${AUDIO_OUT}" "${filename}"
else
    echo "Playing ${filename} with subtitles ${subtitle}"
    omxplayer -r -b -o "${AUDIO_OUT}" --subtitles "${subtitle}" "${filename}"
fi;

