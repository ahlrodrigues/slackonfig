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

#
##
###
##################################################################################
# Most wanted paths

crondaily=/home/ahlr/Downloads
log=/var/log/duplicity
minilicense=/tmp/minilicense.txt
colors=/tmp/colors.txt
rawdocs=https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/docs
rawconfigs=https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/configs

#
##
###
##################################################################################
# Permissions

permix="chmod +x"
permi0="chmod 770"
permi7="chmod 777"

#
##
###
##################################################################################
# Colors

#0 Normal Characters
#1 Bold Characters
#4 Underlined Characters
#5 Blinking Characters
#7 Reverse video Characters

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
##################################################################################
# Test if you are logged in as root

if [[ $(whoami) == "root" ]]; then

#
##
###
##################################################################################
# Test if you are online

dialog                                         \
   --title 'Wait'                           \
   --infobox '\nTesting connection, please wait ...'  \
   05 40
    ping -q -c2 8.8.8.8 > /dev/null
    sleep 5
    
    if [ $? -eq 0 ]; then
        dialog                                         \
        --title 'Success'                           \
        --infobox '\nYou are connected!'  \
        05 40
        sleep 5
        clear
#
##
###
##################################################################################
# Downloading auxiliary files in the /tmp directory

        echo
        echo
        echo -e "$RED Verificando se é necessários baixar arquivos auxiliare...: $NC"
        echo
        echo
            if [ ! -f "$minilicense" ]; then
                echo -e "$GREEN Baixando...: $NC $aminilicensetxt"
                echo
                echo
                wget -q  -nv -e robots=0 -r -nd -cP /tmp $rawdocs/minilicense.txt
            else
                echo -e "$RED Arquivo $GREEN minilicense.txt $RED foi encontrado. $NC"
            fi
                
            sleep 5
                    
            if [ ! -f "$colors" ]; then
                echo -e "$GREEN Baixando...: $NC $acolorstxt"
                echo
                echo
                wget -q  -nv -e robots=0 -r -nd -cP /tmp $rawdocs/colors.txt
            else
                echo -e "$RED Arquivo $GREEN colors.txt $RED foi encontrado. $NC"
            fi
            sleep 5
            clear

#
##
###
##################################################################################
# Menu

funcheck=(dialog --separate-output --checklist "Select to apply preconfigured functions:" 0 0 0)

options=(
 1 "bblazetonico  - Faz backup no backblaze_TONICO" off 
 2 "option 2" off
 3 "option 3" off
 4 "option 4" off
 5 "option 5" off
 6 "option 6" off
 7 "option 7" off)
 
selections=$("${funcheck[@]}" "${options[@]}" 2>&1 > /dev/tty)

clear

for selection in $selections
do
 case $selection in
 1) # Creating the file backblaze_TONICO.sh

            if [ $bblazetonico == yes ]; then
                echo -e "$bblazetonicotxt"
                    
                if [ ! -d $log ]; then
                    mkdir $log 
                fi
                                            
                echo "#!"$SHELL > $crondaily/backblaze_TONICO.sh
                cat $minilicense >> $crondaily/backblaze_TONICO.sh
                cat $colors >> $crondaily/backblaze_TONICO.sh
                echo "clear" >> $crondaily/backblaze_TONICO.sh
                echo "" >> $crondaily/backblaze_TONICO.sh
                echo "if [[ \$(whoami) == "ahlr" ]]; then" >> $crondaily/backblaze_TONICO.sh
                echo "" >> $crondaily/backblaze_TONICO.sh
                echo "   echo" >> $crondaily/backblaze_TONICO.sh
                echo "   echo" >> $crondaily/backblaze_TONICO.sh
                echo "   echo -e "'"$RED Troque de usuário, o ROOT não pode executar backups $NC"'"" >> $crondaily/backblaze_TONICO.sh
                echo "   echo" >> $crondaily/backblaze_TONICO.sh
                echo "   echo" >> $crondaily/backblaze_TONICO.sh
                echo "   exit 0" >> $crondaily/backblaze_TONICO.sh
                echo "   else" >> $crondaily/backblaze_TONICO.sh
                echo "" >> $crondaily/backblaze_TONICO.sh
                echo "   #B2 configuration variables" >> $crondaily/backblaze_TONICO.sh
                echo "   B2_ACCOUNT="cd0c87d370b7"" >> $crondaily/backblaze_TONICO.sh
                echo "   B2_KEY="0010db1dde3b5edd54f9890392d42d089c782a4457"" >> $crondaily/backblaze_TONICO.sh
                echo "   B2_BUCKET="TONICO"" >> $crondaily/backblaze_TONICO.sh
                echo "   B2_DIR=""" >> $crondaily/backblaze_TONICO.sh
                echo "" >> $crondaily/backblaze_TONICO.sh
                echo "   # Local directory to backup" >> $crondaily/backblaze_TONICO.sh
                echo "   LOCAL_DIR="$dropbox/TONICO/"" >> $crondaily/backblaze_TONICO.sh
                echo "" >> $crondaily/backblaze_TONICO.sh
                echo "   # GPG key (last 8 characters)" >> $crondaily/backblaze_TONICO.sh
                echo "   ENC_KEY="A2133DA2"" >> $crondaily/backblaze_TONICO.sh
                echo "   SGN_KEY="A2133DA2"" >> $crondaily/backblaze_TONICO.sh
                echo "   export PASSPHRASE="xxxxxxxxxxxxxx"" >> $crondaily/backblaze_TONICO.sh
                echo "   export SIGN_PASSPHRASE="xxxxxxxxxxxxxx"" >> $crondaily/backblaze_TONICO.sh
                echo "" >> $crondaily/backblaze_TONICO.sh
                echo "   # Remove files older than 90 days" >> $crondaily/backblaze_TONICO.sh
                echo "   duplicity \\" >> $crondaily/backblaze_TONICO.sh
                echo "   --sign-key \$SGN_KEY --encrypt-key \$ENC_KEY \\" >> $crondaily/backblaze_TONICO.sh
                echo "   remove-older-than 90D --force \\" >> $crondaily/backblaze_TONICO.sh
                echo "   b2://\${B2_ACCOUNT}:\${B2_KEY}@\${B2_BUCKET} > \$log/ backblaze_TONICO.log" >> $crondaily/backblaze_TONICO.sh
                echo "" >> $crondaily/backblaze_TONICO.sh
                echo "   # Perform the backup, make a full backup if it's been over 30 days" >> $crondaily/backblaze_TONICO.sh
                echo "   duplicity \\" >> $crondaily/backblaze_TONICO.sh
                echo "   --sign-key \$SGN_KEY --encrypt-key \$ENC_KEY \\" >> $crondaily/backblaze_TONICO.sh
                echo "   --full-if-older-than 30D \\" >> $crondaily/backblaze_TONICO.sh
                echo "   \${LOCAL_DIR} b2://\${B2_ACCOUNT}:\${B2_KEY}@\${B2_BUCKET} >> \$log/ backblaze_TONICO.log" >> $crondaily/backblaze_TONICO.sh
                echo "" >> $crondaily/backblaze_TONICO.sh
                echo "   # Cleanup failures" >> $crondaily/backblaze_TONICO.sh
                echo "   duplicity \\" >> $crondaily/backblaze_TONICO.sh
                echo "   cleanup --force \\" >> $crondaily/backblaze_TONICO.sh
                echo "   --sign-key $SGN_KEY --encrypt-key $ENC_KEY \\" >> $crondaily/backblaze_TONICO.sh
                echo "   b2://\${B2_ACCOUNT}:${B2_KEY}@\${B2_BUCKET} >> \$log/ backblaze_TONICO.log" >> $crondaily/backblaze_TONICO.sh
                echo "" >> $crondaily/backblaze_TONICO.sh
                echo "   # Show collection-status" >> $crondaily/backblaze_TONICO.sh
                echo "   duplicity collection-status \\" >> $crondaily/backblaze_TONICO.sh
                echo "   --sign-key \$SGN_KEY --encrypt-key \$ENC_KEY \\" >> $crondaily/backblaze_TONICO.sh
                echo "   b2://\${B2_ACCOUNT}:\${B2_KEY}@\${B2_BUCKET} >> \$log/ backblaze_TONICO.log" >> $crondaily/backblaze_TONICO.sh
                echo "" >> $crondaily/backblaze_TONICO.sh
                echo "   # Unset variables" >> $crondaily/backblaze_TONICO.sh
                echo "   unset B2_ACCOUNT" >> $crondaily/backblaze_TONICO.sh
                echo "   unset B2_KEY" >> $crondaily/backblaze_TONICO.sh
                echo "   unset B2_BUCKET" >> $crondaily/backblaze_TONICO.sh
                echo "   unset B2_DIR" >> $crondaily/backblaze_TONICO.sh
                echo "   unset LOCAL_DIR" >> $crondaily/backblaze_TONICO.sh
                echo "   unset ENC_KEY" >> $crondaily/backblaze_TONICO.sh
                echo "   unset SGN_KEY" >> $crondaily/backblaze_TONICO.sh
                echo "   unset PASSPHRASE" >> $crondaily/backblaze_TONICO.sh
                echo "   unset SIGN_PASSPHRASE" >> $crondaily/backblaze_TONICO.sh 
                echo "fi" >> $crondaily/backblaze_TONICO.sh
                $permix $crondaily/backblaze_TONICO.sh
                $permi0 $crondaily/backblaze_TONICO.sh
            fi
 ;;
 2)
 echo "You chose the option 2"
 ;;
 3)
 echo "You chose the option 3"
 ;;
 4)
 echo "You chose the option 4"
 ;;
 5)
 echo "You chose the option 5"
 ;;
 6)
 echo "You chose the option 6"
 ;;
 7)
 echo "You chose the option 7"
 ;;
 esac
done
 

# --------- Cleaning all --------- #
clear

                                   
                                    

#
##
###
################################################################################## 
# It's the end

        else
            echo
            echo
            echo -e "$RED Voce nao esta Conectado! $NC"
            echo
            echo
        fi


    else
    echo
    echo
    echo -e "$RED Logue-se como ROOT! $NC"
    echo
    echo
fi
