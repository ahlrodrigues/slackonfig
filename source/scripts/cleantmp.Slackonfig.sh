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

permix="chmod +x"
permi0="chmod 755"
rcd=/etc/rc.d

if [[ $(whoami) == "root" ]]; then

    echo "#!"$SHELL > $rcd/rc.local_shutdown
    echo "#" >> $rcd/rc.local_shutdown
    echo "#" >> $rcd/rc.local_shutdown
    echo "cd /tmp && rm -rf -- *[!"ahlr"]* 2>/dev/null" >> $rcd/rc.local_shutdown
    echo "cd /var/tmp && rm -rf * 2>/dev/null" >> $rcd/rc.local_shutdown
    echo "/usr/bin/find /tmp -mindepth 1 -maxdepth 1 -exec /bin/rm -rf {} +;" >> $rcd/rc.local_shutdown
    echo ""
    echo "if  [ ! -d /tmp/lost+found ]; then" >> $rcd/rc.local_shutdown
    echo    "find /tmp/lost+found -exec /bin/touch {} \;" >> $rcd/rc.local_shutdown
    echo "fi" >> $rcd/rc.local_shutdown
    echo ""
    echo "find /tmp -type s -exec  /bin/touch {} \;" >> $rcd/rc.local_shutdown
    echo "find /tmp -type d -empty -mtime +37 -exec /bin/rmdir {} \;" >> $rcd/rc.local_shutdown
    echo "find /tmp -type f -mtime +37 -exec rm -rf {} \; " >> $rcd/rc.local_shutdown
    echo ""
    echo ""
    $permix $rcd/rc.local_shutdown
    $permi0 $rcd/rc.local_shutdown
    
    
    sleep 3

else
    echo
    echo
    echo -e "$RED Logue-se como ROOT! $NC"
    echo
    echo
fi
