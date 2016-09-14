#!/bin/sh

#Vlc

pkg='vlc'
if dpkg --get-selections | grep -q "^$pkg[[:space:]]*install$" >/dev/null; then
  echo $pkg' installed'
else
  echo 'Instalando '$pkg

  sudo apt update

  sudo apt install vlc
fi
