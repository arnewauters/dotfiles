#!/bin/zsh

brew_install() {
    echo "\nInstalling $1"
    if brew list $1 &>/dev/null; then
        echo "${1} is already installed"
    else
        brew install $1 && echo "$1 is installed"
    fi
}

brew_install_cask() {
    echo "\nInstalling $1"
    if brew list $1 &>/dev/null; then
        echo "${1} is already installed"
    else
        brew install --cask $1 && echo "$1 is installed"
    fi
}

if ! [ -x "$(command -v kitty)" ]; then
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh
fi

if ! [ -x "$(command -v starship)" ]; then
  curl -sS https://starship.rs/install.sh | sh
fi

if ! [ -x "$(command -v asdf)" ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  asdf install nodejs latest

  asdf plugin add ruby
  asdf install ruby latest
fi

brew_install "gnupg"
brew tap homebrew/cask-fonts && brew_install_cask "font-fira-code"
