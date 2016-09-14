#Global git configuration

# See: https://stackoverflow.com/questions/242538/unix-shell-script-find-out-which-directory-the-script-file-resides/1638397#1638397
# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")

#User name

git config --global user.name Raphael

#User email

git config --global user.email raphaelbsferreira@gmail.com

#Editor
git config --global core.editor vim

#Template
git config --global commit.template $SCRIPTPATH/.gitmessage
