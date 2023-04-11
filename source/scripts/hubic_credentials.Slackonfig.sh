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
# --------- Variáveis --------- #
rawdocs=https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/docs
minilicense=/tmp/minilicense.txt
colors=/tmp/colors.txt
name=/root/.hubic_credentials

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



# --------- Criando script - INÍCIO --------- #

echo "#!"$SHELL > $name
cat $minilicense >> $name

    echo "" >> $name
    echo "" >> $name
    echo "#Backup da pasta /home/ahlr/Dropbox/NET4YOU/" >> $name
    echo "email = financeiro@net4you.com.br" >> $name
    echo "password = xxxxxxxxx" >> $name
    echo "client_id = api_hubic_AX1GBGXFqcoFRaB6TcmORhneQ33DYgdp" >> $name
    echo "client_secret = mraqgIdiNnxdp6oPX2SrH0w0CDFsmviE822hKvba9OA5KFw9SFatkB6Gl0mQEou5" >> $name
    echo "redirect_uri = http://localhost/" >> $name
    chown 600 $name
    echo
    echo
    echo "Não esqueça de informar a senha no arquivo /home/ahlr/.hubic_credentials"
    echo
    echo

# --------- Criando script - FIM --------- #
else
    echo
    echo
    echo -e "$BRED Logue-se como ROOT! $NC"
    echo
    echo
fi
