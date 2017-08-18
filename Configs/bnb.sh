#!/bin/bash
clear

if [[ $(whoami) == "root" ]]; then
   
    echo
    echo
    echo -e "\e[ \t\e[1;31;40m Troque de usuário, o ROOT não pode acessar o BNB\e$NC"
    echo
    echo
      exit 0
else
    
    
#Buscar arquivos de remessa do BNB;
arquivos1=`ls /home/ahlr/Downloads/ | awk '/.rem/ { print $0 }'`
arquivos2=`ls /home/ahlr/.wine/drive_c/skyline/inbox/ | awk '/.SAI/ { print $0 }'`


echo
echo
echo
echo -e "\e[ \t\e[1;34;40m Buscando arquivos... \e$NC"

if [ "$arquivos1" != "" ]; then
cd /home/ahlr/Downloads/
echo
echo
echo
echo -e "Arquivo\e[\t$CYAN$arquivos1\e$NC encontrado! "
echo
echo
echo
mv /home/ahlr/Downloads/$arquivos1 /home/ahlr/.wine/drive_c/skyline/outbox
wine /home/ahlr/.wine/drive_c/SKYLINE/skyline.exe /se=bnb123 2> /dev/null

cat /home/ahlr/.wine/drive_c/skyline/SESSION.LOG | grep -i "Transmitindo arquivo"
cat /home/ahlr/.wine/drive_c/skyline/SESSION.LOG | grep -i "Transmissão dos arquivos"
echo
echo
echo
echo
else

wine /home/ahlr/.wine/drive_c/SKYLINE/skyline.exe /se=bnb123 2> /dev/null

echo
echo
echo

if [ "$arquivos2" != "" ]; then
cd /home/ahlr/.wine/drive_c/skyline/inbox/
echo -e "Arquivo\e[\t$CYAN$arquivos2\e$NC encontrado! "
echo
echo
echo
cat /home/ahlr/.wine/drive_c/skyline/SESSION.LOG | grep -i "recebido como"
echo
echo
echo
else

echo
echo
echo
echo
cat /home/ahlr/.wine/drive_c/skyline/SESSION.LOG | grep -i "Nenhum arquivo pendente"
echo
echo
echo
echo
exit 1
fi
fi

fi