#!/bin/bash

sudo apt-get install zsh i3 git

function install {
    # TODO: Offer to replace symbolic link
    if [ -h $2 ]
    then
        echo "Symbolic link $2 already exists"
        return
    fi

    #TODO: Ask before backing up
    if [ -f $2 ]
    then
        echo "$2 already exists, moving to $2-orig"
        mv $2 $2-orig
    fi

    ln -s $PWD/$1 $2
}

install "vimrc" "${HOME}/.vimrc"
install "gitconfig" "${HOME}/.gitconfig"
install "zshrc" "${HOME}/.zshrc"

install "i3/config" "${HOME}/.i3/config"
install "i3/i3status.conf" "${HOME}/.i3status.conf"
sudo install "i3/i3.session" "/usr/share/gnome-session/sessions/"
sudo install "i3/i3-gnome.desktop" "/usr/share/xsessions/"
sudo install "i3/i3.desktop" "/usr/share/applications/"

# Disable gnome desktop
#gsettings set org.gnome.desktop.background show-desktop-icons false

# Install vundle if necessary
if [ ! -e ${HOME}/.vim/bundle/vundle ]
then
    echo "Installing vundle"
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

# Install oh-my-zsh if necessary
if [ ! -e ${HOME}/.oh-my-zsh ]
then
    echo "Installing oh-my-zsh"
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

# Switch to zsh
chsh -s /usr/bin/zsh
