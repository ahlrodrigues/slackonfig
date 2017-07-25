#!/bin/sh

# Rsync Slackware-live Alien's mirror

rsync -azhv --progress rsync://taper.alienbase.nl/mirrors/slackware-live/ /mnt/sda3/Slackware/Slackware-live/                             