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
#
##
###
# --------- Variáveis --------- #
rawdocs=https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/docs
minilicense=/tmp/minilicense.txt
colors=/tmp/colors.txt
#name=/etc/rc.d/rc.local_shutdown
name=/home/ahlr/Documents/rc.local_shutdown

# --------- Baixando arquivos auxiliares no diretório /tmp --------- #

if [ ! -f "$minilicense" ]; then
	wget -q  -nv -e robots=0 -r -nd -cP /tmp \
	$rawdocs/minilicense.txt
fi
    
if [ ! -f "$colors" ]; then
	wget -q  -nv -e robots=0 -r -nd -cP /tmp \
	$rawdocs/colors.txt

fi

# --------- Checando permissão - INÍCIO --------- #
if [[ $(whoami) == "root" ]]; then

# --------- Criando script - CABEÇALHO --------- #
echo "#!"$SHELL > $name
cat $minilicense >> $name
cat $colors >> $name

echo "#" >> $name
echo "##" >> $name
echo "###" >> $name
echo "#####" >> $name
echo "" >> $name
# --------- Criando script - INÍCIO --------- #

echo "LOCATION="/home/ahlr/Downloads"" >> $name
echo 'for FILE in $LOCATION/*; do ' >> $name
echo '  if [[ $FILE == *.torrent ]]; then ' >> $name
echo '     rm "$FILE" ' >> $name
echo "  fi " >> $name
echo "done " >> $name
echo "" >> $name
echo "#####" >> $name
echo "###" >> $name
echo "##" >> $name
echo "#" >> $name
# --------- Criando script - FIM --------- #

echo
echo -e "$WHITE $name $GREEN criado com sucesso! $NC"
echo

# --------- Aviso --------- #
else
    echo
    echo
    echo -e "$BRED Logue-se como ROOT! $NC"
    echo
    echo
fi
