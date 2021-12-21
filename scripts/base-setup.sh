#!/bin/bash
apt update -y

install() {
    which $1 &> /dev/null

    if [ $? -ne 0 ]; then
        echo "Installing: ${1}..."
        apt install $1 -y
    else
        echo "Already installed: ${1}"
    fi
}
# Min
install ed
install curl
install dtach
install htop
install tmux
install vim
install vifm
install wget
install xclip

# Python
install python3
install python3-pip

# Networking Tools
install fping
install iptables
install iptables-persistent
install net-tools
install nmap
install nslookup
install traceroute

# Hardening Tools
#install apt-listbugs
#install auditd
#install debsums
#install debsecan
#install chkrootkit
#install clamav
#install fail2ban
#install logrotate
#install lynis
#install needrestart
#install pkg-config


# SymLinking DotFiles
mkdir -p $HOME/.config/vifm

dotfilesDir=$(pwd)

linkDotfile() {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${dest}"
    rm ${dest} 

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

linkDotfile .ackrc
linkDotfile .bashrc
linkDotfile .bash_aliases
linkDotfile .curlrc
linkDotfile .config/vifm
linkDotfile .gf
linkDotfile .gitconfig
linkDotfile .gitignore
linkDotfile .inputrc
linkDotfile scripts
linkDotfile .tmux.conf
linkDotfile .vim
linkDotfile .vimrc
linkDotfile .xinitrc

source $dotfilesDir/.bash_aliases
source $dotfilesDir/.bashrc
source $dotfilesDir/.vimrc

# Hardening SSHD
#sed -i 's/#Port 22/Port CHANGE_DESIRED/g' /etc/ssh/sshd_config
sed -i 's/#LogLevel INFO/LogLevel VERBOSE/g' /etc/ssh/sshd_config
# only after adding your ssh key with a user
# sed -i 's/#PermitRootLogin prohibit-passowrd/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i 's/#MaxAuthTries 6/MaxAuthTries 3/g' /etc/ssh/sshd_config
sed -i 's/#MaxSessions 10/MaxSessions 2/g' /etc/ssh/sshd_config
sed -i 's/#AllowAgentForwarding yes/AllowAgentForwarding no/g' /etc/ssh/sshd_config
sed -i 's/#AllowTcpForwarding yes/AllowTcpForwarding no/g' /etc/ssh/sshd_config
sed -i 's/X11Forwarding yes/X11Forwarding no/g' /etc/ssh/sshd_config
systemctl restart sshd

# Fail2ban Setup
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Umask Hardening
sed -i 's/022/027/g' /etc/login.defs

# Setup IPTable FireWall
~/scripts/firewall
# Save IPTable Rule Persistance
/etc/init.d/netfilter-persistent save

# Movin CronJob Scripts
cp ~/scripts/cleanup.sh /etc/cron.daily/
cp ~/scripts/update.sh /etc/cron.weekly/
#cp ~/scripts/backup.sh /etc/cron.weekly/

# Full Upgrade and Apt Cleaning
apt upgrade -y && apt full-upgrade && apt-get autoremove --purge -y && apt clean -y

# Cleaning up a little
rm -rf /tmp/*
rm -rf /var/tmp/*
rm -rf /root/.cache/thumbnails

