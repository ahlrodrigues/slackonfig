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
usa=/usr/share/applications
rawimgs=https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/imgs
dropbox=/home/ahlr/Dropbox

# --------- Baixando arquivos auxiliares no diretório /tmp --------- #

    if [ ! -f "/tmp/minilicense.txt" ]; then
	wget -q  -nv -e robots=0 -r -nd -cP /tmp \
	https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/docs/minilicense.txt
    fi
# --------- Baixando arquivos auxiliares no diretório /tmp --------- #

    cat /tmp/minilicense.txt >> $usa/addclient.desktop 
    wget -q  -nv -e robots=0 -r -nd -cP /usr/share/icons/ $rawimgs/client.png
    echo "[Desktop Entry]" > $usa/addclient.desktop
    echo "Exec=libreoffice $dropbox/NET4YOU/NET4YOU/Finanças/Planilha_Modelo_clientes.xls" >> $usa/addclient.desktop
    echo "GenericName=Cadastro de clientes na Conta Azul" >> $usa/addclient.desktop
    echo "Icon=client.png" >> $usa/addclient.desktop
    echo "Name=Cadastro de clientes na Conta Azul" >> $usa/addclient.desktop
    echo "Categories=Office;" >> $usa/addclient.desktop
    echo "NoDisplay=false" >> $usa/addclient.desktop
    echo "StartupNotify=true" >> $usa/addclient.desktop
    echo "Terminal=0" >> $usa/addclient.desktop
    echo "X-KDE-SubstituteUID=false" >> $usa/addclient.desktop
    update-desktop-database -q
