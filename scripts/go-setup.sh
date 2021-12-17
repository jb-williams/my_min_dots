#!/bin/bash

# Dirty dirty dirty
VERSION="1.17.2"

source .bashrc
mkdir -p $HOME/go/src/github.com

wget https://storage.googleapis.com/golang/go$VERSION.linux-amd64.tar.gz
tar xvfz go$VERSION.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo mv go /usr/local/

install() {                                                                 
    which $1 &> /dev/null

    if [ $? -ne 0 ]; then
        echo "Installing: ${1}..."
        go install $1
    else
        echo "Already installed: ${1}"
    fi
}


install golang.org/x/tools/cmd/goimports@latest
install github.com/nsf/gocode@latest
install github.com/tomnomnom/gf@latest
install github.com/tomnomnom/gron@latest

rm go$VERSION.linux-amd64.tar.gz
