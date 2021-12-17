#!/bin/bash
# weekly commonly

mkdir -p /var/backups

tar czf /var/backups/home.tar.gz /home

t_date=$(date '+%m%d%Y')
mv /var/backups/home.tar.gz /var/backups/home.${t_date}.tar.gz

ls -lah /var/backups > /var/backups/file_report.txt
free -h > /var/backups/disk_report.txt
df -h >> /var/backups/disk_report.txt
