SmartiePi
==========

A simple set of scripts for a "Smart TV" using a Raspberry Pi.

Requirements
=============

 * mp3info
 * omxplayer
 * curl
 * youtube-dl
 * feh
 * transmission

Downloading Smartiepi
======================

To download, you need to install ```git``` on your Raspberry pi

```bash
sudo apt-get install git
```

Then clone this repository:

```bash
git clone https://github.com/tooringanalytics/smartiepi.git
```

Installation
=============

First download Smartiepi and make sure the requirements are satisfied.

cd to the sorce directry and execute ```install.sh```.

Add ```~bin``` to the PATH environment variable.

```bash
export PATH=~bin:${PATH}
```

Also add the above line to your ```~/.bashrc``` file.


Usage
======

Playing Music
--------------

Music should be stored under ```/home/pi/Music/external```.

```bash
plamusic.sh '.*\/Western.*\.(mp3|avi|ogg)$'
```

The environment variable ```AUDIO_OUT``` can be used to set the audio output.
It can be one of "hdmi", "local" or "alsa" (default). Use ```hdmi``` for direct hdmi
audio output, ```local``` for audio through the headphone socket and ```alsa```
for output through bluetooth, for example (assuming bluetooth is the default
output configured by ALSA).

Playing Youtube Videos
-----------------------
Youtube play requires the packes youtube-pl which is downloaded by isntall.sh
Youtube videos are downloaded and stored under ```/home/pi/Videos/youtube```.

Playing Movies
---------------

You should store Movies under ```/home/pi/Videos/Movies```. You may also store
a subtitles file in the 'SRT' format (with the extension ```.srt```) in the
same directory as the movie file.

To play a movie:

```bash
plamusic.sh ~/Videos/Movies/path/to/movie.avi
```

This will automatically look for and use the subtitles file if it is present in the
same directory as the movie file.

Playing Slideshows
-------------------

Slideshows require the ```feh``` package which is installed by the installation script.

Go to the Start type menu at he bottom left hand corner, selecting Preferences and then Screensaver.

Set the blank out time to 720 (the max allowed time)
