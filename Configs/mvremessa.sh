#!/bin/bash

#Apaga arquivos de retorno do BNB;
arquivos1=*.REM
arquivos2=*.SAI

if
[ -e /home/ahlr/Downloads/$arquivos1 ];
then
echo
echo 
echo -e "\e[ \t\e[1;32;40m Testando a existencia de arquivos de REMESSA... \e[0m"
sleep 5
echo
echo
echo
echo 
echo -e "\e[ \t\e[1;34;40m Arquivo encontrado... \e[0m"
echo
cd /home/ahlr/Downloads/
echo $arquivos1
echo
echo 
echo 
echo -e "\e[ \t\e[1;31;40m Movendo arquivo de remessa e abrindo Skyline.... \e[0m"
sleep 5
mv /home/ahlr/Downloads/$arquivos1 /home/ahlr/.wine/drive_c/skyline/outbox
wine /home/ahlr/.wine/drive_c/SKYLINE/skyline.exe 2> /dev/null
echo -e "\e[ \t\e[1;33;40m Remessa enviada! \e[0m"
else
echo
echo
echo
echo
echo -e "\e[ \t\e[1;35;40m Buscando arquivos de retorno... \e[0m"
wine /home/ahlr/.wine/drive_c/SKYLINE/skyline.exe 2> /dev/null
if
[ -e /home/ahlr/.wine/drive_c/skyline/inbox/$arquivos2 ];
sleep 5
echo
echo
echo
echo
echo -e "\e[ \t\e[1;35;40m Arquivo *.SAI encontrado! \e[0m"
then
cd /home/ahlr/.wine/drive_c/skyline/inbox/
sleep 5
echo
echo
echo
echo
echo $arquivos2
echo
echo
echo
echo
echo -e "\e[ \t\e[1;35;40m Baixe os boletos pelo MK-AUTH! \e[0m"
echo
echo
echo
echo
else
echo -e "\e[ \t\e[1;35;40m Não existem arquivos *.SAI hoje.\e[0m"
echo
echo
fi
fi
echo
echo
echo
echo
exit