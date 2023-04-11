#!/bin/bash

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

if [[ $(whoami) == "root" ]]; then

ping -q -c2 8.8.8.8 > /dev/null
  clear
    if [ $? -eq 0 ]; then


echo
echo
echo -e "$BROWN Verificando mirror CURRENT! $NC"
echo
echo
mirror-slackware-current.sh
echo
echo
echo

# echo
# echo
# echo -e "$BROWN Verificando mirror ARM! $NC"
# echo
# echo
# mirror-slackwarearm-current.sh
# echo
# echo
# echo
#
echo
echo
echo -e "$BROWN Verificando mirror MULTILIB! $NC"
echo
echo
multilib.sh
echo
echo
echo

echo
echo
echo -e "$BROWN Verificando mirror Alien Bob! $NC"
echo
echo
pkg64.sh

echo
echo
echo -e "$BGREEN MIRRORS ATUALIZADOS! $NC"
echo
echo


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
echo -e "$BRED Logue-se como ROOT! $NC"
echo
echo

fi

echo -e "$PINK Vamos instalar as atualizações? Y|N $NC"
    read install

    case $install in

    Y|y)
        slackpkg update && slackpkg upgrade-all && slackpkg install-new
    ;;

    N|n)
        echo -e "$GREEN Pacotes disponíveis nos mirrors locais $NC"
      exit
    ;;

    *)
    echo
    echo
    echo
    echo -e "$BRED Ok, algo deu errado! $NC"
    exit
    sleep 5
    ;;
    esac












