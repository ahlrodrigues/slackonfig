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

# Checando se usuário "não root"
if [[ $(whoami) != "root" ]]; then

config=$HOME/.config/kde-l10n-ptbr
raiz=/mnt/arquivos/kde-l10n
stable5_po=$raiz/stable/l10n-kf5
trunk5_po=$raiz/trunk/l10n-kf5
trunk6_po=$raiz/trunk/l10n-kf6

# Commit, update, install
case $1 in

      "-i")
            # Cria as configs
            if [ ! -e $config ]; then
                  echo "raiz=/mnt/arquivos/kde-l10n" >> $config
                  echo "nome=Antonio Henrique Lacerda Rodrigues" >> $config
                  echo "email=ahlr_2000@yahoo.com" >> $config
                  echo "desenvolvedor=S" >> $config
                  echo
                  echo -e "$GREEN Pronto, ambiente configurado! $NC"


            elif

            # Define e cria os diretórios locais
               [ ! -d $raiz ]; then
                  mkdir -p $stable5_po
                  mkdir -p $trunk5_po
                  mkdir -p $trunk6_po


                  # Entra em cada um dos diretórios e faz o checkout inicial dos arquivos
                  varsvn="svn+ssh://svn@svn.kde.org/home/kde/branches"

                  #Ativando agente SSH e Registrando senha SSH
                  eval `ssh-agent`
                  echo
                  ssh-add
                  echo

                  cd $stable5_po
                  svn checkout $varsvn/stable/l10n-kf5/templates
                  svn checkout $varsvn/stable/l10n-kf5/pt_BR

                  cd $trunk5_po
                  svn checkout $varsvn/trunk/l10n-kf5/templates
                  svn checkout $varsvn/trunk/l10n-kf5/pt_BR

                  cd $trunk6_po
                  svn checkout $varsvn/trunk/l10n-kf6/templates
                  svn checkout $varsvn/trunk/l10n-kf6/pt_BR
                  echo
                  echo -e "$GREEN Pronto, ambiente configurado!  $NC"
            else
                  echo
                  echo -e "$GREEN Ambiente configurado! $NC"
                  echo
                  echo -e "$GREEN Utilize um dos argumentos a seguir: $WHITE-c $RED para COMMITAR ou $WHITE-u $RED para ATUALIZAR. $NC"
                  echo
            fi
            ;;
      "-c") if [ ! -e $config -o ! -e $raiz ]; then
                  echo
                  echo -e "$RED Crie as configurações e/ou a árvore de diretórios utilizando o argumento $WHITE -i $RED. $NC"
                  echo
                  exit 1
            else
                  echo
                  eval `ssh-agent`
                  ssh-add
                  echo
                  cd $raiz
                  svn commit -m "Translation and Internationalization" stable/l10n-kf5/pt_BR/* trunk/l10n-kf5/pt_BR/* trunk/l10n-kf6/pt_BR/*
                  echo
                  ssh-add -d
                  ssh-agent -k
                  echo
                  echo -e "$GREEN Commit realizado! $NC"
                  echo

            fi
            ;;

      "-u") if [ ! -e $config ] || [ ! -e $raiz ]; then
                  echo
                  echo -e "$RED Crie as configurações e/ou a árvore de diretórios utilizando o argumento $WHITE -i $RED. $NC"
                  echo
                  exit 1
            else
                  echo
                  eval `ssh-agent`
                  ssh-add
                  echo
                  cd $raiz
                  svn up stable/l10n-kf5/pt_BR/* stable/l10n-kf5/templates/* trunk/l10n-kf5/pt_BR/* trunk/l10n-kf5/templates/* trunk/l10n-kf6/pt_BR/* trunk/l10n-kf6/templates/*
                  echo
                  ssh-add -d
                  ssh-agent -k
                  echo
                  echo -e "$GREEN Ambiente atualizado! $NC"
                  echo

            fi
            ;;

      *) echo ""
            echo -e "$RED ERROR - Utilize um dos argumentos a seguir: $WHITE-c $RED para COMMITAR, $WHITE-u $RED para ATUALIZAR ou $WHITE-i $RED para CRIAR config e diretórios. $NC"
            echo ""
            exit 1
            ;;
esac

else
    echo
    echo
    echo -e "$RED NÃO Logue-se como ROOT! $NC"
    echo
    echo
fi
