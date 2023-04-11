#!/bin/bash
#
##
###
##################################################################################
#                                                                                #
# Copyright 2018; Antonio Henrique (Fela); <ahlr_2000@yahoo.com>                 #
# Todos os direitos reservados.                                                  #
#                                                                                #
#                                                                                #
# Redistribution and use of this script, with or without modification, is        #
# permitted provided that the following conditions are met:                      #
#                                                                                #
# 1. Redistributions of this script must retain the above copyright              #
#    notice, this list of conditions and the following disclaimer.               #
#                                                                                #
#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS OR IMPLIED    #
#  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF          #
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO   #
#  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,        #
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,  #
#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;   #
#  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,      #
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR       #
#  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF        #
#  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.                                    #
#                                                                                #
##################################################################################
#                                                                                #
# Repositry:                                                                     #
# github.com/ahlrodrigues/slackonfig                                             #
# bitbucket.org/ahlrodrigues/slackonfig                                          #
#                                                                                #
# Bugs, Thanks, "Constructive" reviews!                                          #
# Send me an email, I'll be very grateful!                                       #
#                                                                                #
##################################################################################
#                                                                                #
# This scripts is a free softwares, you can redistribute it and/or modifies it   #
# within the terms of the GNU General Public License.                            #
#                                                                                #
# GNU General Public License:                                                    #
# [GPL](https://pt.wikipedia.org/wiki/GNU_General_Public_License)                #
# Fundação do Software Livre (FSF) Inc. 51 Franklin St, Fifth Floor,             #
# Boston, MA 02110-1301 USA                                                      #
#                                                                                #
##################################################################################
###
##
#
rcl=/etc/rc.d/rc.local

if [ ! -d /mnt/box1 ];then
    mkdir /mnt/box1
        chmod 777 /mnt/box1
            echo "mount -t cifs //192.168.1.51/Volume_1/ /mnt/box1/ -o username=tonico,password=scotland,vers=1.0" >>  $rcl
else
            echo "mount -t cifs //192.168.1.51/Volume_1/ /mnt/box1/ -o username=tonico,password=scotland,vers=1.0" >> $rcl
fi

if [ ! -d /mnt/box2 ];then
    mkdir /mnt/box2
        chmod 777 /mnt/box2
            echo "mount -t cifs //192.168.1.50/Volume_1/Transmission/ /mnt/box2/ -o username=tonico,password=scotland,vers=1.0" >>  $rcl
else
            echo "mount -t cifs //192.168.1.50/Volume_1/Transmission/ /mnt/box2/ -o username=tonico,password=scotland,vers=1.0" >>  $rcl
fi

if [ ! -d /mnt/box3 ];then
    mkdir /mnt/box3
        chmod 777 /mnt/box3
            echo "mount -t cifs //192.168.1.52/Volume_1/Transmission/ /mnt/box3/ -o username=tonico,password=scotland,vers=1.0" >>  $rcl
else
            echo "mount -t cifs //192.168.1.52/Volume_1/Transmission/ /mnt/box3/ -o username=tonico,password=scotland,vers=1.0" >>  $rcl     
fi

if [ ! -d /mnt/plexhome ];then
    mkdir /mnt/plexhome
        chmod 777 /mnt/box3
            echo "mount -t cifs //192.168.1.52/Volume_1/Transmission/ /mnt/plexhome -o username=tonico,password=scotland,vers=1.0" >>  $rcl
else
            echo "mount -t cifs //192.168.1.52/Volume_1/Transmission/ /mnt/plexhome -o username=tonico,password=scotland,vers=1.0" >>  $rcl     
fi

if [ ! -d /mnt/plexhd1 ];then
    mkdir /mnt/plexhd1
        chmod 777 /mnt/plexhd1
            echo "mount -t cifs //192.168.1.52/Volume_1/Transmission/ /mnt/plexhd1 -o username=tonico,password=scotland,vers=1.0" >>  $rcl
else
            echo "mount -t cifs //192.168.1.52/Volume_1/Transmission/ /mnt/plexhd1 -o username=tonico,password=scotland,vers=1.0" >>  $rcl     
fi


#Monta compartilhamento NASBOX pelo /etc/fstab
#mount -t cifs //192.168.1.210/dropbox/NET4YOU/ /home/ahlr/NASBOX/ -o username=antonio,password=tossbagscotland,iocharset=utf8,sec=ntlm,nofail,vers=1.0

#Monta compartilhamento NASBOX pelo /etc/rc.d/rc.local
#mount -t cifs //192.168.1.52/Volume_1/Transmission/ /mnt/box3/ -o username=tonico,password=scotland,vers=1.0

