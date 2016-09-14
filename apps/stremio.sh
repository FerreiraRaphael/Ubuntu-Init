#!/bin/sh
APPS_PATH="/apps"
STREMIO_PATH=$APPS_PATH"/stremio"


#Install Stremio
echo 'Instalando Stremio'

#Make dir
[ ! -d $APPS_PATH ] && sudo mkdir $APPS_PATH
if [ -d $STREMIO_PATH ]; then
  echo 'Pasta '$STREMIO_PATH' já existe'
  echo 'Deletando '$STREMIO_PATH' existente'
  sudo rm -rf $STREMIO_PATH
fi
#[ -d /apps/stremio ] && sudo rm -rf /apps/stremio
sudo mkdir $STREMIO_PATH

#Download
if [ ! -f $STREMIO_PATH"/stremio.tar.gz" ]; then
  echo 'Baixando Stremio'
  sudo wget http://dl.strem.io/Stremio3.6.5.linux.tar.gz -O $STREMIO_PATH/stremio.tar.gz
else
  echo 'Stremio já foi baixado'
fi

#Download Icon
ICON_PATH="/usr/share/icons/hicolor/256x256/apps/stremio.png"
if [ ! -f $ICON_PATH ]; then
  echo 'Baixando Icone'
  sudo wget http://www.strem.io/3.0/stremio-white-small.png -O $ICON_PATH
else
  echo 'Icone já foi baixado'
fi

#Extract and delete tar
sudo tar -vzxf $STREMIO_PATH/stremio.tar.gz -C $STREMIO_PATH

sudo rm $STREMIO_PATH/stremio.tar.gz

#Create Link
sudo ln -sf $STREMIO_PATH/Stremio-runtime /usr/bin/stremio

#Desktop Entry
DESKTOP_ENTRY="/usr/share/applications/stremio.desktop"
[ -f $DESKTOP_ENTRY ] && sudo rm $DESKTOP_ENTRY
su -c "echo -e '[Desktop Entry]\nVersion=1.0\nType=Application\nTerminal=false\nName=stremio\nExec=/apps/stremio/Stremio-runtime\nIcon=stremio\nCategories=Application' >> /usr/share/applications/stremio.desktop"
