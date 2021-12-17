#!/bin/bash
# weekly commonly
apt update -y && apt upgrade -y && apt full-upgrade -y && apt-get autoremove --purge -y && apt clean -y
