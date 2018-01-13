SmartiePi
==========

A simple set of scripts for a "Smart TV" using a Raspberry Pi.
To install, create a 'bin' directory in your home folder, and copy
all ```*.sh``` files into that directory.

Requirements
------------
mp3info
omxplayer


Playing Music
--------------

Music should be stored under ```/home/pi/Music/external```.

```bash
plamusic.sh '.*\/Western.*\.(mp3|avi|ogg)$'
```

The environment variable ```AUDIO_OUT``` can be used to set the audio output.
It can be one of "hdmi", "local" or "alsa".


Playing Youtube Videos
-----------------------

Youtube videos are downloaded and stored under ```/home/pi/Videos/youtube```.

Playing Movies
---------------

Movies should be stored under ```/home/pi/Videos/Movies```.

Playing Slideshows
-------------------
