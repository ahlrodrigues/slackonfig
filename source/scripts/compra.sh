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
BGREEN='\e[5;32m'
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

#Converte o formato 'dd/mm/AAAA' para 'AAAAmmdd' que e o aceito pela
#opcao '-d' do comando date
data_compra=`echo "$1" | sed 's:\(..\)/\(..\)/\(....\):\3\2\1:'`


#Cria a variável do valor da NF
valor_NF="$2"
prazo="$3"
parcelas="$4"

clear

echo
echo

echo -e "$BLUE Valor da NF: R$ $2 $NC"
echo

valorp=$( echo "scale = 2; $valor_NF / $parcelas" | bc -l)
echo -e "$GREEN Valor da parcelas: R$ $valorp $NC"
echo
#


if [ $4 = 6 ]; then
echo -e "Prazo: $prazo/$(($prazo *2))/$(($prazo *3))/$(($prazo *4))/$(($prazo *5))/$(($prazo *6))"
echo
p1=$( echo "`date -d "$data_compra $3 day" +%d/%m/%Y`" )
echo "Parcela 1: $p1"
p2=$( echo "`date -d "$data_compra $(($3 *2)) day" +%d/%m/%Y`" )
echo "Parcela 2: $p2"
p3=$( echo "`date -d "$data_compra $(($3 *3)) day" +%d/%m/%Y`" )
echo "Parcela 3: $p3"
p4=$( echo "`date -d "$data_compra $(($3 *4)) day" +%d/%m/%Y`" )
echo "Parcela 4: $p4"
p5=$( echo "`date -d "$data_compra $(($3 *5)) day" +%d/%m/%Y`" )
echo "Parcela 5: $p5"
p6=$( echo "`date -d "$data_compra $(($3 *6)) day" +%d/%m/%Y`" )
echo "Parcela 6: $p6"
echo
echo
fi


if [ $4 = 5 ]; then
echo "Prazo: $prazo/$(($prazo *2))/$(($prazo *3))/$(($prazo *4))/$(($prazo *5))"
echo
p1=$( echo "`date -d "$data_compra $3 day" +%d/%m/%Y`" )
echo "Parcela 1: $p1"
p2=$( echo "`date -d "$data_compra $(($3 *2)) day" +%d/%m/%Y`" )
echo "Parcela 2: $p2"
p3=$( echo "`date -d "$data_compra $(($3 *3)) day" +%d/%m/%Y`" )
echo "Parcela 3: $p3"
p4=$( echo "`date -d "$data_compra $(($3 *4)) day" +%d/%m/%Y`" )
echo "Parcela 4: $p4"
p5=$( echo "`date -d "$data_compra $(($3 *5)) day" +%d/%m/%Y`" )
echo "Parcela 5: $p5"
echo
echo
fi

if [ $4 = 4 ]; then
echo "Prazo: $prazo/$(($prazo *2))/$(($prazo *3))/$(($prazo *4))"
echo
p1=$( echo "`date -d "$data_compra $3 day" +%d/%m/%Y`" )
echo "Parcela 1: $p1"
p2=$( echo "`date -d "$data_compra $(($3 *2)) day" +%d/%m/%Y`" )
echo "Parcela 2: $p2"
p3=$( echo "`date -d "$data_compra $(($3 *3)) day" +%d/%m/%Y`" )
echo "Parcela 3: $p3"
p4=$( echo "`date -d "$data_compra $(($3 *4)) day" +%d/%m/%Y`" )
echo "Parcela 4: $p4"
echo
echo
fi

if [ $4 = 3 ]; then
echo "Prazo: $prazo/$(($prazo *2))/$(($prazo *3))"
echo
p1=$( echo "`date -d "$data_compra $3 day" +%d/%m/%Y`" )
echo "Parcela 1: $p1"
p2=$( echo "`date -d "$data_compra $(($3 *2)) day" +%d/%m/%Y`" )
echo "Parcela 2: $p2"
p3=$( echo "`date -d "$data_compra $(($3 *3)) day" +%d/%m/%Y`" )
echo "Parcela 3: $p3"
echo
echo
fi

if [ $4 = 2 ]; then
echo "Prazo: $prazo/$(($prazo *2)) dias"
echo
p1=$( echo "`date -d "$data_compra $3 day" +%d/%m/%Y`" )
echo "Parcela 1: $p1"
p2=$( echo "`date -d "$data_compra $(($3 *2)) day" +%d/%m/%Y`" )
echo "Parcela 2: $p2"
echo
echo
fi

if [ $4 = 1 ]; then
echo "Prazo: $prazo dias"
echo
p1=$( echo "`date -d "$data_compra $3 day" +%d/%m/%Y`" )
echo "Parcela 1: $p1"
echo
echo
fi

exit 1
