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
echo "log=/var/log/plex.log" >> /usr/local/bin/plexcheck.sh
echo "date=`date '+%Y-%m-%d %H:%M:%S'`" >> /usr/local/bin/plexcheck.sh
echo "codigo_http=$(curl -m 25 -I -s -w "%{http_code}\n" -o /dev/null http://127.0.0.1:32400)" >> /usr/local/bin/plexcheck.sh
echo "code=401" >> /usr/local/bin/plexcheck.sh
echo ""
echo "if [ "$codigo_http" != "$code" ]; then" >> /usr/local/bin/plexcheck.sh
echo "    echo "$date - DELAY!" >> $log" >> /usr/local/bin/plexcheck.sh
echo "        sleep 30" >> /usr/local/bin/plexcheck.sh
echo "            if [ "$codigo_http" != "$code" ]; then"
echo "                echo "$date - RESTART!" >> $log" >> /usr/local/bin/plexcheck.sh
echo "                    /etc/rc.d/rc.plexmediaserver restart" >> /usr/local/bin/plexcheck.sh
echo "            fi" >> /usr/local/bin/plexcheck.sh
echo "else" >> /usr/local/bin/plexcheck.sh
echo "    echo "$date - CHECKED!" >> $log" >> /usr/local/bin/plexcheck.sh
echo "fi" >> /usr/local/bin/plexcheck.sh
echo ""
echo "#Incluindo inicialização do plexcheck no boot" >> /usr/local/bin/plexcheck.sh
echo "echo "#Iniciando plexcheck no boot"" >> /etc/rcd/rc.local >> /usr/local/bin/plexcheck.sh
echo "echo "/usr/local/bin/plexcheck.sh"" >> /etc/rcd/rc.local >> /usr/local/bin/plexcheck.sh

