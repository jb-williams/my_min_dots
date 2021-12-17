#!/bin/bash

cd /home/binford/
source .bashrc

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source "/home/binford/.cargo/env"

install() {                                                                 
    which $1 &> /dev/null

    if [ $? -ne 0 ]; then
        echo "Installing: ${1}..."
        cargo install $1 
    else
        echo "Already installed: ${1}"
    fi
}

#install alacritty
#install bat
#install exa
    
