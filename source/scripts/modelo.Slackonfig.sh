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
# --------- Variáveis fixas --------- #
rawdocs=https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/docs
minilicense=/tmp/minilicense.txt
colors=/tmp/colors.txt
permix="chmod +x"
permi0="chmod 770"

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
name=/etc/cron.daily/backblaze_TONICO.sh
echo "#!"$SHELL > $name
cat $minilicense >> $name
cat $colors >> $name

echo "#" >> $name
echo "##" >> $name
echo "###" >> $name
echo "#####" >> $name
echo "" >> $name
# --------- Criando script - INÍCIO --------- #

#Criação do arquivo backblaze_TONICO.sh

#name=/etc/cron.daily/backblaze_TONICO.sh
B2_ACCOUNT=cd0c87d370b7
B2_KEY=0010db1dde3b5edd54f9890392d42d089c782a4457
B2_BUCKET=Dropbox
ENC_KEY=A2133DA2
SGN_KEY=A2133DA2
PASSPHRASE='\&ntu\$1@\$m0'
dropbox=/home/ahlr/Dropbox
log=/var/log/backblaze


if [ ! -d $log ]; then
    mkdir $log
fi

    echo "#!"$SHELL > $name
    cat $minilicense >> $name
    cat $colors >> $name
    echo "clear" >> $name
    echo "" >> $name
    echo "if [[ \$(whoami) == "ahlr" ]]; then" >> $name
    echo "" >> $name
    echo "   echo" >> $name
    echo "   echo" >> $name
    echo "   echo -e "'"$RED Troque de usuário, o ROOT não pode executar backups $NC"'"" >> $name
    echo "   echo" >> $name
    echo "   echo" >> $name
    echo "   exit 0" >> $name
    echo "   else" >> $name
    echo "" >> $name
    echo "   #B2 configuration variables" >> $name
    echo "   B2_ACCOUNT="$B2_ACCOUNT"" >> $name
    echo "   B2_KEY="$B2_KEY"" >> $name
    echo "   B2_BUCKET="$B2_BUCKET"" >> $name
    echo "   B2_DIR=""" >> $name
    echo "   log=/var/log/backblaze" >> $name
    echo "" >> $name
    echo "   # Local directory to backup" >> $name
    echo "   LOCAL_DIR="$dropbox"" >> $name
    echo "" >> $name
    echo "   # GPG key (last 8 characters)" >> $name
    echo "   ENC_KEY="$ENC_KEY"" >> $name
    echo "   SGN_KEY="$SGN_KEY"" >> $name
    echo "   export PASSPHRASE="$PASSPHRASE"" >> $name
    echo "   export SIGN_PASSPHRASE="$PASSPHRASE"" >> $name
    echo "" >> $name
    echo "   # Remove files older than 90 days" >> $name
    echo "   duplicity \\" >> $name
    echo "   --sign-key \$SGN_KEY --encrypt-key \$ENC_KEY \\" >> $name
    echo "   remove-older-than 90D --force \\" >> $name
    echo "   b2://\${B2_ACCOUNT}:\${B2_KEY}@\${B2_BUCKET} > \$log/backblaze_TONICO.log" >> $name
    echo "" >> $name
    echo "   # Perform the backup, make a full backup if it's been over 30 days" >> $name
    echo "   duplicity \\" >> $name
    echo "   --sign-key \$SGN_KEY --encrypt-key \$ENC_KEY \\" >> $name
    echo "   --full-if-older-than 30D \\" >> $name
    echo "   \${LOCAL_DIR} b2://\${B2_ACCOUNT}:\${B2_KEY}@\${B2_BUCKET} >> \$log/backblaze_TONICO.log" >> $name
    echo "" >> $name
    echo "   # Cleanup failures" >> $name
    echo "   duplicity \\" >> $name
    echo "   cleanup --force \\" >> $name
    echo "   --sign-key $SGN_KEY --encrypt-key $ENC_KEY \\" >> $name
    echo "   b2://\${B2_ACCOUNT}:\${B2_KEY}@\${B2_BUCKET} >> \$log/backblaze_TONICO.log" >> $name
    echo "" >> $name
    echo "   # Show collection-status" >> $name
    echo "   duplicity collection-status \\" >> $name
    echo "   --sign-key \$SGN_KEY --encrypt-key \$ENC_KEY \\" >> $name
    echo "   b2://\${B2_ACCOUNT}:\${B2_KEY}@\${B2_BUCKET} >> \$log/backblaze_TONICO.log" >> $name
    echo "" >> $name
    echo "   # Unset variables" >> $name
    echo "   unset PASSPHRASE" >> $name
    echo "   unset SIGN_PASSPHRASE" >> $name
    echo "fi" >> $name
    $permix $name
    $permi0 $name

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
