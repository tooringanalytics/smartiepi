#!/bin/bash
HOME="/home/pi"
INSTALL_PATH="${HOME}/bin"
MUSIC_PATH="${HOME}/Music"
VIDEOS_PATH="${HOME}/Videos"
PICTURES_PATH="${HOME}/Pictures"
EXTERNAL="external"
YOUTUBE="youtube"
MOVIES="Movies"

EXTERNAL_STORAGE_PATH="$1"

if [ -z "${EXTERNAL_STORAGE_PATH}" ]; then
    echo "Error - External storage path not found"
    exit -1
fi;

# Cleanup existing mess


# Ensure directories
echo "Creating Directories..."
mkdir -p "${PICTURES_PATH}"
mkdir -p "${MUSIC_PATH}"
mkdir -p "${VIDEOS_PATH}"

mkdir -p "${EXTERNAL_STORAGE_PATH}/Pictures"
mkdir -p "${EXTERNAL_STORAGE_PATH}/Music"
mkdir -p "${EXTERNAL_STORAGE_PATH}/Videos/${YOUTUBE}"
mkdir -p "${EXTERNAL_STORAGE_PATH}/Videos/${MOVIES}"

# Setup symlinks to external storage
echo "Setting up symlinks to external storage ${1}..."
ln -sf "${EXTERNAL_STORAGE_PATH}/Pictures" "${PICTURES_PATH}/${EXTERNAL}"
ln -sf "${EXTERNAL_STORAGE_PATH}/Music" "${MUSIC_PATH}/${EXTERNAL}"
ln -sf "${EXTERNAL_STORAGE_PATH}/Videos/${YOUTUBE}" "${VIDEOS_PATH}/${YOUTUBE}"
ln -sf "${EXTERNAL_STORAGE_PATH}/Videos/${MOVIES}" "${VIDEOS_PATH}/${MOVIES}"

# Copy the scripts
echo "Copying scripts..."
mkdir -p "${INSTALL_PATH}"
cp *.sh "${INSTALL_PATH}"
chmod +x "${INSTALL_PATH}/*.sh"

# Install dependencies
echo "Installing dependencies..."
sudo apt-get update -y
sudo apt-get install -y \
mp3info \
omxplayer \
feh \
transmission-daemon \
transmission-cli \
transmission-common \
curl \
xvkbd \
realvnc-vnc-server \
realvnc-vnc-viewer
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/bin/youtube-dl
sudo chmod a+rx /usr/bin/youtube-dl

# Enable SSH and disable screen blanking
echo "Enabling SSH, Disabling screen blanking..."
sudo touch /boot/ssh
sudo sed '/consoleblank/d' /boot/cmdline.txt >/boot/cmdline.txt
sudo echo 'consoleblank=0' >>/boot/cmdline.txt


echo "Adding scripts to path..."
[[ ":$PATH:" != *":/home/pi/bin:"* ]] && echo 'export PATH=/home/pi/bin:${PATH}' >>~/.bash_profile
source ~/.bash_profile

echo "Done!"
echo "Rebooting in 5 seconds..."
sleep 5
sudo reboot now
