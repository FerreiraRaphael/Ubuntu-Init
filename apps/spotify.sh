#!/bin/sh

#Install Spotify
#Copy from https://www.spotify.com/br/download/linux/

pkg='spotify-client'
if dpkg --get-selections | grep -q "^$pkg[[:space:]]*install$" >/dev/null; then
  echo 'Spotify installed'
else
  # 1. Add the Spotify repository signing key to be able to verify downloaded packages
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886

  # 2. Add the Spotify repository
  echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

  # 3. Update list of available packages
  sudo apt-get update

  # 4. Install Spotify
  sudo apt-get install $pkg
fi
