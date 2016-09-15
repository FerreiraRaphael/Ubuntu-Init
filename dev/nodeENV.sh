pkg='nvm'

if [ -d "$HOME/.$pkg" ]; then
  echo $pkg' installed'

else
  echo $pkg' not installed'
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash
fi

# if dpkg --get-selections | grep -q "^$pkg[[:space:]]*install$" >/dev/null; then
#   echo $pkg' installed'
# else
#   echo $pkg' not installed'
# fi

pkg='nodejs'

if dpkg --get-selections | grep -q "^$pkg[[:space:]]*install$" >/dev/null; then
  echo $pkg' installed'
else
  sudo apt install $pkg
fi
