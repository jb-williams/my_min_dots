#!/bin/bash

sudo firewall-cmd --zone=block --add-icmp-block=echo-reply --add-icmp-block=echo-request
sudo firewall-cmd --zone=dmz --add-icmp-block=echo-reply --add-icmp-block=echo-request
sudo firewall-cmd --zone=drop --add-icmp-block=echo-reply --add-icmp-block=echo-request
sudo firewall-cmd --zone=external --add-icmp-block=echo-reply --add-icmp-block=echo-request
sudo firewall-cmd --zone=home --add-icmp-block=echo-reply --add-icmp-block=echo-request
sudo firewall-cmd --zone=public --add-icmp-block=echo-reply --add-icmp-block=echo-request
sudo firewall-cmd --zone=trusted --add-icmp-block=echo-reply --add-icmp-block=echo-request
sudo firewall-cmd --zone=work --add-icmp-block=echo-reply --add-icmp-block=echo-request

#sudo firewall-cmd --zone=block --change-interface=enp36s0
#sudo firewall-cmd --zone=dmz --change-interface=enp36s0
#sudo firewall-cmd --zone=drop --change-interface=enp36s0
#sudo firewall-cmd --zone=external --change-interface=enp36s0
sudo firewall-cmd --zone=home --change-interface=enp36s0
#sudo firewall-cmd --zone=trusted --change-interface=enp36s0
#sudo firewall-cmd --zone=work --change-interface=enp36s0

sudo firewall-cmd --zone=public --change-interface=wlp0s20f3

#sudo firewall-cmd --zone=block --change-interface=wlp0s20f3
#sudo firewall-cmd --zone=dmz --change-interface=wlp0s20f3
#sudo firewall-cmd --zone=drop --change-interface=wlp0s20f3
#sudo firewall-cmd --zone=external --change-interface=wlp0s20f3
#sudo firewall-cmd --zone=home --change-interface=wlp0s20f3
#sudo firewall-cmd --zone=trusted --change-interface=wlp0s20f3
#sudo firewall-cmd --zone=work --change-interface=wlp0s20f3
