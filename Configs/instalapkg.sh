#!/bin/bash

wget -e robots=0 -r -nd https://download.teamviewer.com/download/teamviewer_i386.deb
wget -e robots=0 -r -nd http://slackbuilds.org/slackbuilds/14.2/network/teamviewer.tar.gz
tar zvxf teamviewer.tar.gz
mv teamviewer_i386.deb teamviewer/
cd teamviewer
./teamviewer.SlackBuild
installpkg teamviewer-*.tgz




wget -e robots=0 -r -nd http://downloads.sourceforge.net/bogofilter/bogofilter-1.2.4.tar.bz2
wget -e robots=0 -r -nd http://slackbuilds.org/slackbuilds/14.2/system/bogofilter.tar.gz
tar zvxf bogofilter.tar.gz
mv bogofilter-1.2.4.tar.bz2 bogofilter/
cd bogofilter
./bogofilter.SlackBuild
installpkg bogofilter-*tgz
