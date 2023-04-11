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
if [[ $(whoami) != "root" ]]; then

cd /mnt/sda3/kde-l10n/

case $1 in

    "-c") eval `/usr/bin/ssh-agent`
          ssh-add
          svn commit -m "Translation and Internationalization" stable/l10n-kf5/pt_BR/* trunk/l10n-kf5/pt_BR/*
          ;;
    "-u") eval `/usr/bin/ssh-agent`
          ssh-add
          svn up stable/l10n-kf5/pt_BR/* stable/l10n-kf5/templates/* trunk/l10n-kf5/pt_BR/* trunk/l10n-kf5/templates/*
          ;;
    *) echo ""
       echo "ERROR - Utilize um dos seguintes argumentos: '"-c"' para COMMITAR ou '"-u"' para ATUALIZAR"
       echo ""
       exit 1
          ;;
esac

echo ""
ssh-add -d
ssh-agent -k


echo ""

else
    echo
    echo
    echo "NÃO Logue-se como ROOT!"
    echo
    echo
fi
