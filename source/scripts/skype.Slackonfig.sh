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

clear

if [[ $(whoami) == ahlr ]]; then

   echo
   echo
   echo -e "$RED Troque de usuário, o ROOT não pode executar backups $NC"
   echo
   echo
   exit 0
   else
   
nomep=skypeforlinux
formatop=deb
downloads=/home/ahlr/Downloads/
fonte=https://repo.skype.com/deb/pool/main/s/skypeforlinux/ 

                echo
                echo
                echo -e "$BROWN Clique no link abaixo utilizando a tecla CTRL e baixe o novo pacote: $NC"
                echo 
                echo
                echo

                echo
                echo
                echo -e "$WHITE https://repo.skype.com/deb/pool/main/s/skypeforlinux/ $NC"
                echo 
                echo
                echo
                sleep 5
                echo -e "$BROWN Já tem novo pacote? Y|N $NC"
                read package
                case $package in
                Y|y)
                clear
                
wget -q  -nv -e robots=0 -r -nd -cP /home/ahlr/Downloads/ https://slackbuilds.org/slackbuilds/14.2/network/skypeforlinux.tar.gz

cd $downloads
    if [ -e $nomep.tar.gz ] && [ -e $nomep_*.$formatop ]; then
        tar zvxf $nomep.tar.gz
            mv $nomep*.$formatop $nomep
    else
    
                echo
                echo
                echo -e "$PINK Algo deu errado, o Fonte não foi encontrado! $NC"
                echo 
                echo
                echo
            exit
    fi
echo
echo
echo

    
    versao=`ls $nomep/$nomep*.$formatop | awk -F '_' {'print \$2'}`
    sed -i "s/VERSION:-.*/VERSION:-$versao}/g" $nomep/$nomep.SlackBuild
    cd $nomep
    ./$nomep.SlackBuild
    echo
    echo
    echo
    echo -e "$GREEN Vamos instalar o programa $BBROWN $nomep? Y|N $NC"
    read install
    case $install in
    Y|y)
    clear
    upgradepkg /tmp/$nomep*
    ;;
    N|n)
    exit
    echo -e "$GREEN Pacote disponível na pasta /tmp $NC"
    ;;
    *)
    echo
    echo
    echo
    echo -e "$RED Ok, algo deu errado! $NC"
    exit
    sleep 5
    ;;
    esac
    rm -fr $downloads/$nomep*
    rm -fr /tmp/$nomep*
;;
N|n)
echo
echo
echo
echo -e "$RED Ok, algo deu errado! $NC"
echo 
echo
echo
    exit
;;
esac
fi
