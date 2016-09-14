
#Steam
path="~/Downloads"
file=$path"/steam_latest.deb"

#Download
[ -f $file ] && rm $file
wget http://repo.steampowered.com/steam/archive/precise/steam_latest.deb -P $path

#Install
sudo dpkg -i $file

#dependencies
sudo apt-get install -f
