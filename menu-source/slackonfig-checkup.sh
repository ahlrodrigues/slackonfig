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
# Change the variable slackonfig = no / slackonfig = yes to apply preconfigured functions: 

# inittab | ntp | cups | konsole | lang | 

slackonfig=no

# To enable the functions in this script, change the variables below to "yes".
# See the functions of each script on the homepage of the slackonfig project:
# https://github.com/ahlrodrigues/slackonfig

mlocal=no
cleanret=no       
mvrejsgr=no
cleansici=no
cleansai=no
cleancache=no
ntp=no
samba=no
cups=no
shutdown=no
teamviewerd=no
plex=no
mirrorx86_64=no
mirrorarm=no  
inittab=no
networkmanager=no
konsole=no
reccx=no
brother=no
lang=no
thunderbackup=no
thunderbird=no
bblazetonico=no
bblazenet4you=no
data=no
winbox=no
cashflow=no
skyline=no
cobranca=no
slackpkg=no
slackpkgplus=no
pkgs=yes
hubiCNET4YOU=no
credhubiCNET4YOU=no
multilib=no
sshbackup=no
ktown=no
clamav=no
projetos=no
doplexpkg=no
doteamviewerpkg=no
dochangelog=yes

# --------- posts --------- #
bblazetonicotxt="$GREEN Faz backup no backblaze_TONICO; $NC"




# --------- Most wanted paths  --------- #
crondaily=/etc/cron.daily
cronhourly=/etc/cron.hourly
minilicense=/tmp/minilicense.txt
colors=/tmp/colors.txt
lpkgs=/tmp/pkgs.txt
rcd=/etc/rc.d
ulbin=/usr/local/bin
usa=/usr/share/applications
blacklist=">> /etc/slackpkg/blacklist"
rawdocs=https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/docs
rawconfigs=https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/configs
imag="/home/ahlr/Dropbox/TONICO/Projetos/slackonfig/imgs"
drop=/home/ahlr/Dropbox
downloads=/home/ahlr/Downloads
permix="chmod +x"
permi0="chmod 770"
caminho=/mnt/sda3/Slackware
home=/home/ahlr
null="/dev/null"

 

# --------- Cleaning all --------- #
clear

# --------- Colors  --------- #
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

# #Instalação dos programas listados no arquivo pkg.txt
# if [ $pkgs == yes ]; then
#     grep -q '^file' '/etc/slackpkg/mirrors'
#     if [ $? = 0 ]; then
#     grep -q '^MIRRORPLUS['multilib']' '/etc/slackpkg/slackpkgplus.conf' echo $?
#     if [ $? = 0 ]; then
#     grep -q '^MIRRORPLUS['alienbob']' '/etc/slackpkg/slackpkgplus.conf'
#     if [ $? = 0 ]; then
#     if [ ! -f "$pkgs" ]; then
# 	echo -e "$apkgstxt"
# 	wget -q  -nv -e robots=0 -r -nd -cP /tmp $rawdocs/pkgs.txt
#     else
# 	echo -e "$RED Arquivo $GREEN $apkgstxt $RED foi encontrado. $NC"
# 	sleep 5
#     fi
#     echo -e "$pkgstxt"
#     echo "pacotes instalados"
#     else
#     echo -e "$RED Configure o MIRRORPLUS['alienbob'] $NC"
#     exit
#     fi
#     else
#     echo -e "$RED Configure o MIRRORPLUS['multilib'] $NC"
#     exit
#     fi
#     else
#     echo -e "$RED Configure o /etc/slackpkg/mirrors $NC"
#     exit
#     fi
#     sleep 5
# fi


# Criar script que move os arquivos da CEF
if [ $cleanret == yes ]; then
    echo -e "$cleanrettxt"
    echo "#!"$SHELL > $crondaily/cleanret.sh
    cat $minilicense >> $crondaily/cleanret.sh
    echo "#" >> $crondaily/cleanret.sh
    echo "pasta_origem=$downloads" >> $crondaily/cleanret.sh
    echo "pasta_retorno=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/CX/Retornos" >> $crondaily/cleanret.sh
    echo "pasta_remessa=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/CX/Remessa" >> $crondaily/cleanret.sh
    echo "#" >> $crondaily/cleanret.sh
    echo "#" >> $crondaily/cleanret.sh
      if [ ! -d $pasta_retorno ]; then
	mkdir /home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/CX/Retornos/
      fi
      if [ ! -d $pasta_remessa ]; then
	mkdir /home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/CX/Remessa/
      fi
    echo "arquivos=`ls $downloads | awk '/R*.ret/ { print \$0 }'`" >> $crondaily/cleanret.sh
    echo "if [ \"\$arquivos\" != \"\" ]; then" >> $crondaily/cleanret.sh
    echo "mv \$pasta_origem/R*.ret \$pasta_retorno" >> $crondaily/cleanret.sh
    echo "fi" >> $crondaily/cleanret.sh
    echo "arquivos2=ls $downloads | awk '/E*.rem/ { print \$0 }'" >> $crondaily/cleanret.sh
    echo "" >> $crondaily/cleanret.sh
    echo "if [ \"\$arquivos\" != \"\" ]; then" >> $crondaily/cleanret.sh
    echo "mv \$pasta_origem2/E*.rem \$pasta_remessa" >> $crondaily/cleanret.sh
    echo "fi" >> $crondaily/cleanret.sh
    $permix $crondaily/cleanret.sh
    #$permi0 $crondaily/cleanret.sh    
    sleep 5
fi



