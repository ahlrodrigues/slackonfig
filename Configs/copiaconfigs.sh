#!/bin/bash

ping -q -c5 google.com > /dev/null
 
if [ $? -eq 0 ]
then
echo
echo
echo
echo -e "\e[ \t\e[1;35;40m Conectado! \e[0m"
echo
echo
echo

echo -e "\e[ \t\e[1;35;40m Dando permissao de execucao para todos os arquivos... \e[0m"
echo 
chmod +x *.sh
echo
echo


echo
echo -e "\e[ \t\e[1;33;40m Copiando todos os scripts para as devidas pastas e executando processos de Configuracoes \e[0m"
echo                                                                                       
echo
echo
echo
echo -e "\e[ \t\e[1;35;40m bnb.sh => Busca arquivos de retorno da BNB \e[0m"
echo
cp bnb.sh /usr/local/bin/
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m cleanret.sh => Mover os arquivos de retorno da caixa \e[0m"
echo
cp cleanret.sh /etc/cron.daily/
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m configsbackup.sh => Mover os arquivos de backup das configuracoes \e[0m"
echo
cp configsbackup.sh /etc/cron.hourly/
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m cleansai.sh => Mover os arquivos de retorno do bnb \e[0m"
echo
cp cleansai.sh /etc/cron.daily/
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m cleantmp.sh => Limpa a pasta /tmp \e[0m"
echo
cp cleantmp.sh /etc/cron.daily/
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m cleanstale.sh => Limpa a pasta /tmp \e[0m"
echo
cp cleanstale.sh /etc/cron.daily/
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m cleancache.sh => Limpa o cache \e[0m"
echo
cp cleancache.sh /etc/cron.daily/
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m ntp.conf => Configuracoes do NTP \e[0m"
echo
cp ntp.conf /etc/
/etc/rc.d/rc.ntpd restart
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m ntp.conf => Configuracoes do NTP \e[0m"
echo
cp ntp.conf /etc/
/etc/rc.d/rc.cups restart
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m rc.local_shutdown => Configurações de shutdown \e[0m"
echo
cp rc.local_shutdown /etc/rc.d/
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m rc.local => Configurações do rc.local \e[0m"
echo
cp rc.local /etc/rc.d/
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m mirror-slackware => Administracao dos mirros locais \e[0m"
echo
cp mirror-slackware32-current.sh /usr/local/bin/
cp mirror-slackware64-current.sh /usr/local/bin/
#cp mirror-slackware-live.sh /usr/local/bin/
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m inittab => Configuracao de init 4 \e[0m"
echo
cp inittab /etc/
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m slackpkg => Configuracao do slackpkg e slackpkgplus \e[0m"
echo
wget -e robots=0 -A .txz -r -nd http://www.slakfinder.org/slackpkg+/pkg/
installpkg slackpkg+*
rm slackpkg+*
cp mirrors /etc/slackpkg/
cp slackpkgplus.conf /etc/slackpkg/
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m slackpkg => Aplicacao do layer multilib \e[0m"
echo

slackpkg update gpg
slackpkg update
slackpkg upgrade multilib
slackpkg install multilib
cp blacklist /etc/slackpkg
rm uninstaller_*
rm brscan*
rm cupswr*
rm dcp7065*
slackpkg install $(cat /mnt/sda3/Scripts/configs/pkgs.txt)
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m Instalacao do Dropbox \e[0m"
echo
konsole -e dropbox start -i
konsole -e dropbox autostart y
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m Instalacao do Skyline \e[0m"
echo
konsole -e wine /home/ahlr/Dropbox/NET4YOU/NET4YOU/Packages/Skyline.exe
cp wtcm.ini /home/ahlr/.wine/drive_c/skyline/
konsole -e wine /home/ahlr/.wine/drive_c/skyline/skyline.exe

sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m instalacao do driver da impressora \e[0m"
echo
konsole -e ./linux-brprinter-installer-2.1.1-1
sleep 3



echo
echo
echo -e "\e[ \t\e[1;35;40m rc.4 => Configuracao do init com KDE \e[0m"
echo
cp rc.4 /etc/rc.d/
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m rc.4 => Inicialzando networkmanager \e[0m"
echo
chmod +x /etc/rc.d/rc.networkmanager
sleep 3

echo
echo
#echo -e "\e[ \t\e[1;35;40m boinc.sh => link para inicialização do BOIC \e[0m"
#echo
#cp boinc.sh /usr/local/bin/
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m data.sh => Script de calculo data \e[0m"
echo
cp data.sh /usr/local/bin/
chmod -R 777 /usr/local/bin/data.sh
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m thunderbirdbackup.sh => Backup do Thunderbird \e[0m"
echo
cp thunderbirdbackup.sh /etc/cron.daily/
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m profiles.ini=>  Restauracao das Configuracoes do thunderbird \e[0m"
echo
mkdir /home/ahlr/.thunderbird
chown -R ahlr /home/ahlr/.thunderbird/
cp /mnt/sda3/Thunderbird/profile.ini /home/ahlr/.thunderbird/

sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m Cria pasta para os arquivos da CEF e dá permissão de execucao \e[0m"
echo
mkdir -p /opt/caixa/Recebidos
chmod -R 777 /opt/caixa
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m Cria pasta para os arquivos do BNB e dá permissão de execucao \e[0m"
echo
mkdir -p /home/ahlr/.wine/drive_c/skyline/recebidos
chown ahlr -R /home/ahlr/.wine/
sleep 3

echo
echo
echo -e "\e[ \t\e[1;35;40m Configurando local pt-BR \e[0m"
echo
cp lang.* /etc/profile.d/
sleep 3

# Comando para comentar todas as linhas de um arquivo
#cat /etc/profile.d/lang.sh | sed -i '/#/!s/^/\#/' /etc/profile.d/lang.sh >> /etc/profile.d/lang.sh


echo
echo

echo                                                                                       
echo "Compilando e Instalando pacotes"                            
echo                                                                                       
echo
sleep 3

echo
echo
echo "Instalando TeamViewer"
wget -e robots=0 -r -nd https://download.teamviewer.com/download/teamviewer_i386.deb
wget -e robots=0 -r -nd http://slackbuilds.org/slackbuilds/14.2/network/teamviewer.tar.gz
tar zvxf teamviewer.tar.gz
mv teamviewer_i386.deb teamviewer/
cd teamviewer
./teamviewer.SlackBuild
installpkg /tmp/teamviewer-*.tgz
rm teamviewer*
sleep 3


#echo
#echo
#echo "Instalando Spotify"
#wget -e robots=0 -A _amd64.deb -r -nd http://repository.spotify.com/pool/non-free/s/spotify-client/
#wget -e robots=0 -A .tar.gz -r -nd http://slackbuilds.org/slackbuilds/14.2/multimedia/spotify.tar.gz
#tar zvxf
#sleep 3



echo
echo
echo "Instalando Bogofilter"
wget -e robots=0 -r -nd http://downloads.sourceforge.net/bogofilter/bogofilter-1.2.4.tar.bz2
wget -e robots=0 -r -nd http://slackbuilds.org/slackbuilds/14.2/system/bogofilter.tar.gz
tar zvxf bogofilter.tar.gz
mv bogofilter-1.2.4.tar.bz2 bogofilter/
cd bogofilter
./bogofilter.SlackBuild
installpkg /tmp/bogofilter-*tgz
sleep 3

echo
echo
echo
echo
echo
echo -e "\e[ \t\e[1;35;40m Pacotes instalado e Configurações copiadas!! \e[0m"
echo
echo
echo
echo
else
echo -e "\e[ \t\e[1;31;40m Voce nao esta Conectado! \e[0m"
echo
exit
fi