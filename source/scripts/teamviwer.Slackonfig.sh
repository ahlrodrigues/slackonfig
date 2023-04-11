#!/bin/bash
#
##
###
##################################################################################
#                                                                                #
# Copyright 2018; Antonio Henrique (Fela); <ahlr_2000@yahoo.com>                 #
#                                                                                #
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
# [GPL](https://en.wikipedia.org/wiki/GNU_General_Public_License)                #
# Fundação do Software Livre (FSF) Inc. 51 Franklin St, Fifth Floor,             #
# Boston, MA 02110-1301 USA                                                      #
#                                                                                #
##################################################################################
###
##
# 
#
##
###

# --------- Efeito nas Cores  --------- #
#0 Normal Characters
#1 Bold Characters
#4 Underlined Characters
#5 Blinking Characters
#7 Reverse video Characters

# --------- Cores  --------- #
BLACK='\e[1;30m'
BBLACK='\e[5;30m'
RED='\e[1;31m'
BRED='\e[5;31m' # bink color
GREEN='\e[1;32m'
BGREEN='\e[1;32m'
BROWN='\e[1;33m'
BBROWN='\e[5;33m'
BLUE='\e[1;34m'
BBLUE='\e[5;34m'
PINK='\e[1;35m'
BPINK='\e[5;35m'
CYAN='\e[1;36m'
BCYAN='\e[5;36m'
WHITE='\e[1;37m'
BWHITE='\e[5;37m'
NC='\033[0m' # reset/no color

if [[ $(whoami) == "root" ]]; then

#The following example shows that ‘SOME_PATTERN’ presents in ‘SOME_FILE’.
#grep -q 'SOME_PATTERN' 'SOME_FILE' && echo $?
#0


    #Desinstalando
    if [ -f /usr/share/applications/teamviewer.desktop ]; then
    rm /usr/share/applications/teamviewer.desktop
    fi
    
    if [ -d /opt/teamviewer ]; then
    rm -fr /opt/teamviewer
    fi
    
    if [ -L /usr/bin/teamviewer ]; then
    rm /usr/bin/teamviewer
    fi
    
    if [ -L /usr/share/pixmaps/teamviewer.png ]; then
    rm /usr/share/pixmaps/teamviewer.png
    fi

    if [ -f /etc/rc.d/rc.teamviewerd ]; then
    rm /etc/rc.d/rc.teamviewerd
    fi   
    
    #Instalando o Teamviewer
    wget -q  -nv -e robots=0 -r -nd -cP /opt/ https://download.teamviewer.com/download/linux/teamviewer_amd64.tar.xz
    tar --directory=/opt -xf /opt/*tar.xz
    chown -R root:root /opt/teamviewer
    chmod -R 755 /opt/teamviewer
    rm /opt/teamviewer*tar.xz
    
    #Criando o teamviewer.desktop
    echo "[Desktop Entry]" > /usr/share/applications/teamviewer.desktop
    echo "Version=1.0" >> /usr/share/applications/teamviewer.desktop
    echo "Encoding=UTF-8" >> /usr/share/applications/teamviewer.desktop
    echo "Type=Application" >> /usr/share/applications/teamviewer.desktop
    echo "Categories=Network;" >> /usr/share/applications/teamviewer.desktop
    echo "Name=TeamViewer 14" >> /usr/share/applications/teamviewer.desktop
    echo "Comment=Remote control and meeting solution." >> /usr/share/applications/teamviewer.desktop
    echo "Exec=/opt/teamviewer/tv_bin/script/teamviewer" >> /usr/share/applications/teamviewer.desktop
    echo "Icon=/usr/share/icons/teamviewer_48.png" >> /usr/share/applications/teamviewer.desktop
    update-desktop-database -q
    
    ln -sf /opt/teamviewer/tv_bin/desktop/teamviewer_48.png /usr/share/pixmaps/teamviewer.png
    ln -s /opt/teamviewer/tv_bin/script/teamviewer /usr/bin/teamviewer
    

    # Criando o rc.teamviewerd
    echo "#!"$SHELL > /etc/rc.d/rc.teamviewerd
    echo "teamviewerd_start() {" >> /etc/rc.d/rc.teamviewerd
    echo "  if [ -x /opt/teamviewer/tv_bin/teamviewerd ]; then" >> /etc/rc.d/rc.teamviewerd
    echo "    echo "Starting TeamViewer Daemon"" >> /etc/rc.d/rc.teamviewerd
    echo "    /opt/teamviewer/tv_bin/teamviewerd --daemon start" >> /etc/rc.d/rc.teamviewerd
    echo "  fi" >> /etc/rc.d/rc.teamviewerd
    echo "}" >> /etc/rc.d/rc.teamviewerd
    echo ""
    echo "teamviewerd_stop() {" >> /etc/rc.d/rc.teamviewerd
    echo "    echo "Terminating TeamViewer Daemon"" >> /etc/rc.d/rc.teamviewerd
    echo "  killall teamviewerd" >> /etc/rc.d/rc.teamviewerd
    echo "}" >> /etc/rc.d/rc.teamviewerd
    echo ""
    echo "teamviewerd_restart() {" >> /etc/rc.d/rc.teamviewerd
    echo "  teamviewerd_stop" >> /etc/rc.d/rc.teamviewerd
    echo "  sleep 2" >> /etc/rc.d/rc.teamviewerd
    echo "  teamviewerd_start" >> /etc/rc.d/rc.teamviewerd
    echo "}" >> /etc/rc.d/rc.teamviewerd
    echo ""
    echo "case "\$1" in" >> /etc/rc.d/rc.teamviewerd
    echo "'start')" >> /etc/rc.d/rc.teamviewerd
    echo "  teamviewerd_start" >> /etc/rc.d/rc.teamviewerd
    echo "  ;;" >> /etc/rc.d/rc.teamviewerd
    echo "'stop')" >> /etc/rc.d/rc.teamviewerd
    echo "  teamviewerd_stop" >> /etc/rc.d/rc.teamviewerd
    echo "  ;;" >> /etc/rc.d/rc.teamviewerd
    echo "'restart')" >> /etc/rc.d/rc.teamviewerd
    echo "  teamviewerd_restart" >> /etc/rc.d/rc.teamviewerd
    echo "  ;;" >> /etc/rc.d/rc.teamviewerd
    echo "*)" >> /etc/rc.d/rc.teamviewerd
    echo "  echo \"usage \$0 start|stop|restart\"" >> /etc/rc.d/rc.teamviewerd
    echo "esac" >> /etc/rc.d/rc.teamviewerd
    
    chmod +x /etc/rc.d/rc.teamviewerd
    chmod -R 755 /etc/rc.d/rc.teamviewerd
    
    echo "if [ -x /etc/rc.d/rc.teamviewerd ]; then" >> /etc/rc.d/rc.local
    echo "/etc/rc.d/rc.teamviewerd start" >> /etc/rc.d/rc.local
    echo "fi" >> /etc/rc.d/rc.local
    
    /opt/teamviewer/tv_bin/teamviewerd --daemon start
    
    echo ""
    echo ""
    echo -e "$BGREEN Teamviewer Instalando e rodando! $NC"

    sleep 5

else
    echo
    echo
    echo -e "$RED Logue-se como ROOT! $NC"
    echo
    echo
fi
