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
echo
echo
echo "Digite a DATA INICIAL: " 
echo

read data1
echo
echo
echo "Digite a DATA FINAL: " 
echo

read data2
echo
echo
echo "Digite o VALOR: " 
echo
echo
read valor
echo


#Converte o formato 'dd/mm/AAAA' para 'AAAAmmdd' que e o aceito pela
#opcao '-d' do comando date
data_inicial=`echo "$data1" | sed 's:\(..\)/\(..\)/\(....\):\3\2\1:'`
data_final=`echo "$data2" | sed 's:\(..\)/\(..\)/\(....\):\3\2\1:'`
#
#Cria a variável do valor da mensalidade
valor_mensalidade="$valor"
#
#Converte a data para o formato timestamp que e mais preciso
data_inicial=`date -d "$data_inicial" "+%s"`
data_final=`date -d "$data_final" "+%s"`
dias_corridos=$((($data_final - $data_inicial) / 86400))
tjuros=6
tmulta=25

#
valor1=`echo "scale = 2; $valor_mensalidade / 30 * $dias_corridos" | bc`
multa=`echo "scale = 2; $valor_mensalidade * $tmulta / 1000" | bc` 
juros=`echo "scale = 2; $valor_mensalidade * $dias_corridos * $tjuros / 10000" | bc`
valor2=`echo "scale = 2; $valor_mensalidade + $multa  + $juros" | bc`
valor3=`echo "scale = 2; $valor1 + $valor_mensalidade" | bc`
clear

echo
echo


echo -e "$WHITE+--------------+   +------------+ $NC"
echo -e "$WHITE| Data Inicial |   | Data Final | $NC"
echo -e "$WHITE+--------------+   +------------+ $NC"
echo -e "$WHITE|$BROWN  $data1  $WHITE|   | $BROWN$data2 $WHITE| $NC"
echo -e "$WHITE+--------------+   +------------+ $NC"
echo

echo -e "$WHITE+----------------------+ $NC"
echo -e "$WHITE| Dias corridos:$BROWN $dias_corridos $NC"
echo -e "$WHITE+----------------------+ $NC"
echo

echo -e "$WHITE+----------------------+ $NC"
echo -e "$WHITE| Mensalidade: $GREEN R$ $valor_mensalidade $NC"
echo -e "$WHITE+----------------------+ $NC"
echo

echo -e "$WHITE+----------------------------------------------------+ $NC"
echo -e "$WHITE| Mensalidade proporcional dos $dias_corridos dias: $GREEN R$ $valor1 $NC"
echo -e "$WHITE+----------------------------------------------------+ $NC"
echo

echo -e "$WHITE+----------------------------------------------------+ $NC"
echo -e "$WHITE| Mensalidade proporcional + Mensalidade: $GREEN R$ $valor3"
echo -e "$WHITE+----------------------------------------------------+ $NC"
echo

echo -e "$WHITE+------------------------------------+ $NC"
echo -e "$WHITE| Valor da multa: $RED R$ $multa $NC"
echo -e "$WHITE+------------------------------------+ $NC"
echo


echo -e "$WHITE+------------------------------------+ $NC"
echo -e "$WHITE| Valor do juros: $RED R$ $juros $NC"
echo -e "$WHITE+------------------------------------+$NC"
echo


echo -e "$WHITE+------------------------------------+ $NC"
echo -e "$WHITE| Mensalidade Atualizada: $RED R$ $valor2 $NC"
echo -e "$WHITE+------------------------------------+ $NC"
echo

exit 1
