#!/bin/bash
#
# Autor= Antonio Henrique (Fela)
# e-mail: ahlr_2000@yahoo.com
#
# Bugs, Agradecimentos, Críticas "construtivas"
# Mande me um e-mail. Ficarei Grato!
#
# Os scripts deste diretório estão disponíveis na esperança que possam ser úteis, 
# mas SEM NENHUMA GARANTIA DE FUNCIONAMENTO, SEM NENHUMA GARANTIA DE ADEQUAÇÃO A 
# QUALQUER MERCADO, SEM NENHUMA GARANTIA DE APLICAÇÃO EM PARTICULAR e NENHUM
# SUPORTE TÉCNICO.

##############################################################################################
#                                                                                            #
# Script: Criação e edição de arquivos de configuração do Slackware GNU/Linux                #
#                                                                                            #
# V0.1                                                                                       #
#                                                                                            #
# Last update: 01/08/2017                                                                    #
#                                                                                            #
##############################################################################################


# --------- Teste se está logado como root
if [ 'whoami' == 'root' ]; then

# --------- Teste se está conectado na internet
ping -q -c5 google.com > /dev/null
 
if [ $? -eq 0 ]; then
  
echo -e "\e[ \t\e[1;35;40m Conectado! \e[0m"
sleep 3
echo

# --------- Baixando arquivos auxiliares no diretório /tmp
wget -cP /tmp https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/Configs/minilicense.txt
wget -cP /tmp https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/Configs/pkgs.txt

# --------- Inicio das Configurações
echo -e "\e[ \t\e[1;33;40m Criando todos os arquivos de configuração nas devidas pastas e executando processos de Configuracoes \e[0m"
sleep 3

echo -e "\e[ \t\e[1;35;40m bnb.sh => Busca arquivos de retorno da BNB \e[0m"
cp bnb.sh /usr/local/bin/
sleep 3

	echo -e "\e[ \t\e[1;35;40m cleanret.sh => Mover os arquivos de retorno da caixa \e[0m"
	echo "#!"$SHELL > /etc/cron.daily/cleanret.sh
	cat /tmp/minilicense.txt >> /etc/cron.daily/cleanret.sh
	echo "#Move arquivos de retorno da CAIXA" >> /etc/cron.daily/cleanret.sh
	echo "pasta_origem=/home/ahlr/Downloads" >> /etc/cron.daily/cleanret.sh
	echo "pasta_destino=/opt/caixa/Recebidos" >> /etc/cron.daily/cleanret.sh
	echo "cd \$pasta_origem && mv *.ret \$pasta_destino" >> /etc/cron.daily/cleanret.sh
	chmod +x /etc/cron.daily/cleanret.sh
    sleep 3
    
    	echo -e "\e[ \t\e[1;35;40m mvrejsgr.sh => Mover os arquivos de rejeitados e francesinha do BNB \e[0m"
	echo "#!"$SHELL > /etc/cron.daily/mvrejsgr.sh
	cat /tmp/minilicense.txt >> /etc/cron.daily/mvrejsgr.sh
	echo "#Mover os arquivos de rejeitados e francesinha do BNB" >> /etc/cron.daily/mvrejsgr.sh
	echo "pasta_origem=/home/ahlr/Downloads" >> /etc/cron.daily/mvrejsgr.sh
	echo "pasta_destino=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/BNB/Arquivos" >> /etc/cron.daily/mvrejsgr.sh
	echo "mv \$pasta_origem/rel*.pdf  \$pasta_origem/Rejeitados-\`"date -d \"-1 day\" +\"%d_%m\""\`.pdf" >> /etc/cron.daily/mvrejsgr.sh
	echo "mv \$pasta_origem/sgr*.pdf  \$pasta_origem/Francesinha-\`"date -d \"-1 day\" +\"%d_%m\""\`.pdf" >> /etc/cron.daily/mvrejsgr.sh
	echo "mv \$pasta_origem/Francesinha*.pdf \$pasta_destino" >> /etc/cron.daily/mvrejsgr.sh
	echo "mv \$pasta_origem/Rejeitados*.pdf \$pasta_destino" >> /etc/cron.daily/mvrejsgr.sh
	chmod +x /etc/cron.daily/mvrejsgr.sh
    sleep 3
    
        echo -e "\e[ \t\e[1;35;40m cleansici.sh => Mover os arquivos declaração do SICI para a pasta /home/ahlr/Dropbox/NET4YOU/NET4YOU/SCM/SICI \e[0m"
	echo "#!"$SHELL > /etc/cron.daily//cleansici.sh
	wget -cP /tmp https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/Docs/minilicense.txt
	cat /tmp/minilicense.txt >> /etc/cron.daily/cleansici.sh
	echo "#Mover os arquivos declaração do SICI para a pasta /home/ahlr/Dropbox/NET4YOU/NET4YOU/SCM/SICI" >> /etc/cron.daily/cleansici.sh
	echo "pasta_origem=/home/ahlr/Downloads" >> /etc/cron.daily/cleansici.sh
	echo "pasta_destino=/home/ahlr/Dropbox/NET4YOU/NET4YOU/SCM/SICI" >> /etc/cron.daily/cleansici.sh
	echo "mv \$pasta_origem/sici*.xml \$pasta_destino 2> /dev/null" >> /etc/cron.daily/cleansici.sh
	chmod +x /etc/cron.daily/cleansici.sh
    sleep 3
    
	echo -e "\e[ \t\e[1;35;40m backupprojetos.sh => Mover os arquivos de backup das configuracoes \e[0m"
	echo "#!"$SHELL >> /etc/cron.hourly/backupprojetos.sh
	echo "rsync -azhv /mnt/sda3/Projetos/ /home/ahlr/Dropbox/TONICO/Projetos/" >> /etc/cron.hourly/backupprojetos.sh
    sleep 3

	echo -e "\e[ \t\e[1;35;40m cleansai.sh => Mover os arquivos de retorno do bnb \e[0m"
	echo "#!"$SHELL >> /etc/cron.daily/cleansai.sh
	echo "#Movendo arquivos de retorno do BNB" >> /etc/cron.daily/cleansai.sh
	echo "pasta_origem=/home/ahlr/.wine/drive_c/skyline/inbox" >> /etc/cron.daily/cleansai.sh
	echo "pasta_destino=/home/ahlr/.wine/drive_c/skyline/recebidos" >> /etc/cron.daily/cleansai.sh
	echo "cd \$pasta_origem && mv *.SAI \$pasta_destino" >> /etc/cron.daily/cleansai.sh
	chmod +x /etc/cron.daily/cleansai.sh
   sleep 3

	echo -e "\e[ \t\e[1;35;40m cleancache.sh => Limpa o cache \e[0m"
	echo "#!"$SHELL >> /etc/cron.daily/cleancache.sh
	echo "echo 3 > /proc/sys/vm/drop_caches" >> /etc/cron.daily/cleancache.sh
	chmod +x /etc/cron.daily/cleancache.sh
    sleep 3

	echo -e "\e[ \t\e[1;35;40m Configuracoes do NTP \e[0m"
	sed -i "s/pool.ntp.org/pool.ntp.br/g" /etc/ntp.conf
	chmod +x /etc/rc.d/rc.ntpd
	/etc/rc.d/rc.ntpd restart
    sleep 3

	echo -e "\e[ \t\e[1;35;40m Inicializando do CUPS \e[0m"
	chmod +x /etc/rc.d/rc.cups
	/etc/rc.d/rc.cups restart
    sleep 3

	echo -e "\e[ \t\e[1;35;40m Configuracoes do Samba \e[0m"
	sed -i "s/MYGROUP/WORKGROUP/g" /etc/samba/smb.conf-sample
	mv /etc/samba/smb.conf-sample /etc/samba/smb.conf
	chmod +x /etc/rc.d/rc.samba
	/etc/rc.d/rc.samba restart
    sleep 3

	echo -e "\e[ \t\e[1;35;40m Configuracoes de rc.local_shutdown \e[0m"
	echo "#!"$SHELL >> /etc/rc.d/rc.local_shutdown
	echo "cd /tmp && rm -rf -- *[!"ahlr"]* 2>/dev/null" >> /etc/rc.d/rc.local_shutdown
	echo "cd /var/tmp && rm -rf * 2>/dev/null" >> /etc/rc.d/rc.local_shutdown
	echo "/usr/bin/find /tmp -mindepth 1 -maxdepth 1 -exec /bin/rm -rf {} +;" >> /etc/rc.d/rc.local_shutdown
	echo "find /tmp/lost+found -exec /bin/touch {} \;" >> /etc/rc.d/rc.local_shutdown
	echo "find /tmp -type s -exec  /bin/touch {} \;" >> /etc/rc.d/rc.local_shutdown
	echo "find /tmp -type d -empty -mtime +37 -exec /bin/rmdir {} \;" >> /etc/rc.d/rc.local_shutdown
	echo "find /tmp -type f -mtime +37 -exec rm -rf {} \; " >> /etc/rc.d/rc.local_shutdown
	chmod +x /etc/rc.d/rc.local_shutdown
    sleep 3

echo -e "\e[ \t\e[1;35;40m Configurações do rc.local \e[0m"
echo "if [ -x /etc/rc.d/rc.teamviewerd ]; then" >> /etc/rc.d/rc.local
echo "/etc/rc.d/rc.teamviewerd start" >> /etc/rc.d/rc.local
echo "fi" >> /etc/rc.d/rc.local
sleep 3

	echo -e "\e[ \t\e[1;35;40m mirror-slackware => Administracao dos mirros locais \e[0m"
	wget -cP /usr/local/bin http://www.slackware.com/~alien/tools/mirror-slackware-current.sh
	sed -i "s|BUILDER:-\"Eric Hameleers <alien@slackware.com>\"|BUILDER:-\"Fela  <ahlr_2000@yahoo.com>\"|g" /usr/local/bin/mirror-slackware-current.sh
	sed -i "s|/home/ftp/pub/Linux/Slackware|/mnt/sda3/Slackware|g" /usr/local/bin/mirror-slackware-current.sh
	sed -i "s|VERBOSE:-\"-q\"|VERBOSE:-\"-v --progress\"|g" /usr/local/bin/mirror-slackware-current.sh
	sed -i "s|ISO:-\"CDROM\"}|ISO:-\"DVD\"}|g" /usr/local/bin/mirror-slackware-current.sh
	sed -i "s|EXCLUDES:-\"--exclude pasture\"|EXCLUDES:-\"--exclude pasture --exclude source\"|g" /usr/local/bin/mirror-slackware-current.sh
	sed -i "s|DVD_EXCLUDES:-\"-x ./testing  -x ./source -x ./extra/source\"|DVD_EXCLUDES:-\"-x ./source -x ./extra/source\"|g" /usr/local/bin/mirror-slackware-current.sh
	cp mirror-slackware-current.sh mirror-slackware32-current.sh
	sed -i "s|ARCH:-\"x86\"|ARCH:-\"x86_64\"|g" /usr/local/bin/mirror-slackware-current.sh
	mv mirror-slackware-current.sh mirror-slackware64-current.sh /usr/local/bin/
	#cp mirror-slackware-live.sh /usr/local/bin/
    sleep 3

#00 8 * * * /usr/local/bin/mirror-slackware64-current.sh /etc/cron.daily 1> /dev/null


sleep 3

	echo -e "\e[ \t\e[1;35;40m Habilitando o init 4 \e[0m"
	sed -i "s/id:3/id:4/g" /etc/inittab
    sleep 3

echo -e "\e[ \t\e[1;35;40m rc.4 => Inicialzando networkmanager \e[0m"
chmod +x /etc/rc.d/rc.networkmanager
/etc/rc.d/rc.networkmanager start
sleep 3

echo -e "\e[ \t\e[1;35;40m data.sh => Script de calculo data \e[0m"
touch /usr/local/bin/data.sh
echo "#!"$SHELL >> /usr/local/bin/data.sh
echo "# Converte o formato 'dd/mm/AAAA' para 'AAAAmmdd' que e o aceito pela" >> /usr/local/bin/data.sh
echo "# opcao '-d' do comando date" >> /usr/local/bin/data.sh
echo "data_inicial=`echo "$1" | sed 's:\(..\)/\(..\)/\(....\):\3\2\1:'`" >> /usr/local/bin/data.sh
echo "data_final=`echo "$2" | sed 's:\(..\)/\(..\)/\(....\):\3\2\1:'`" >> /usr/local/bin/data.sh
echo "valor_mensalidade="$3"" >> /usr/local/bin/data.sh
echo "# Converte a data para o formato timestamp que e mais preciso" >> /usr/local/bin/data.sh
echo "data_inicial=`date -d "$data_inicial" "+%s"`" >> /usr/local/bin/data.sh
echo "data_final=`date -d "$data_final" "+%s"`" >> /usr/local/bin/data.sh
echo "dias_corridos=$((($data_final - $data_inicial) / 86400))" >> /usr/local/bin/data.sh
echo "# Calculo do valor proporcional" >> /usr/local/bin/data.sh
echo "echo "scale = 4; $valor_mensalidade / 30 * $dias_corridos" | bc" >> /usr/local/bin/data.sh
echo "exit 1" >> /usr/local/bin/data.sh
chmod +x /usr/local/bin/data.sh
sleep 3

echo -e "\e[ \t\e[1;35;40m thunderbirdbackup.sh => Backup e Restauracao do Thunderbird \e[0m"
touch /etc/cron.daily/thunderbirdbackup.sh
echo "#!"$SHELL >> /etc/cron.daily/thunderbirdbackup.sh
echo "rsync -azhv /home/ahlr/.thunderbird/ /mnt/sda3/Thunderbird/" >> /etc/cron.daily/thunderbirdbackup.sh
mkdir /home/ahlr/.thunderbird
chown -R ahlr /home/ahlr/.thunderbird/
ls -s /mnt/sda3/Thunderbird/profile.ini /home/ahlr/.thunderbird/
sleep 3

echo -e "\e[ \t\e[1;35;40m rc.4 => Configuracao do init com KDE \e[0m"
cp rc.4 /etc/rc.d/
sleep 3

echo -e "\e[ \t\e[1;35;40m boinc.sh => Arquivo de inicialização do BOIC \e[0m"
touch /usr/local/bin/boinc.sh
echo "#!"$SHELL >> /usr/local/bin/boinc.sh
echo "cd /mnt/sda3/BOINC/" >> /usr/local/bin/boinc.sh
echo "./boinc" >> /usr/local/bin/boinc.sh
chmod +x /usr/local/bin/boinc.sh
sleep 3

echo -e "\e[ \t\e[1;35;40m Cria pasta para os arquivos da CEF e dá permissão de execucao \e[0m"
mkdir -p /opt/caixa/Recebidos
chmod -R 777 /opt/caixa
sleep 3


# --------- Instalação de Packages --------- 

echo -e "\e[ \t\e[1;35;40m slackpkg => Configuracao do slackpkg e slackpkgplus \e[0m"
wget -e robots=0 -A .txz -r -nd http://www.slakfinder.org/slackpkg+/pkg/
installpkg slackpkg+*
rm slackpkg+*
echo -e "\e[ \t\e[1;35;40m slackpkg => Configuracao do slackpkg e slackpkgplus \e[0m"
sed -i "s|^file://path/to/some/diretory|file://mnt/sda3/Slackware/slackware64-current/|g" /etc/slackpkg/mirrors
sed -i "s|^# Slackware|# Slackware x86_64|g" /etc/slackpkg/slackpkgplus.conf
sed -i "/REPOPLUS=(/ c\REPOPLUS=( slackpkgplus restricted alienbob multilib )" /etc/slackpkg/slackpkgplus.conf
sed -i "/# Slackware/ c\MIRRORPLUS[\'alienbob\']=http://taper.alienbase.nl/mirrors/people/alien/sbrepos/current/x86_64/" /etc/slackpkg/slackpkgplus.conf
sed -i "/# Slackware/ a\MIRRORPLUS['alienbob\']=http://taper.alienbase.nl/mirrors/people/alien/sbrepos/current/x86_64/" /etc/slackpkg/slackpkgplus.conf
sed -i "/# Slackware/ a\MIRRORPLUS[\'restricted\']=http://taper.alienbase.nl/mirrors/people/alien/restricted_sbrepos/current/x86_64/" /etc/slackpkg/slackpkgplus.conf
sed -i "/# Slackware/ a\MIRRORPLUS[\'multilib\']=http://taper.alienbase.nl/mirrors/people/alien/multilib/current/" /etc/slackpkg/slackpkgplus.conf
sleep 3

echo -e "\e[ \t\e[1;35;40m slackpkg blacklist=> Configuracao do blacklist \e[0m"
sed -i "/_SBo/ a\[0-9]+alien/" /etc/slackpkg/blacklist
sed -i "/_SBo/ a\[0-9]+compat32" /etc/slackpkg/blacklist
sleep 3

echo -e "\e[ \t\e[1;35;40m slackpkg => Aplicacao do layer multilib \e[0m"
slackpkg update gpg
slackpkg update
slackpkg upgrade multilib
slackpkg install multilib
rm uninstaller_*
rm brscan*
rm cupswr*
rm dcp7065*
sleep 3

echo -e "\e[ \t\e[1;35;40m Instalacao lista de pacotes \e[0m"
slackpkg install $(cat /tmp/pkgs.txt)

sleep 3

echo -e "\e[ \t\e[1;35;40m Instalacao do Dropbox \e[0m"
echo
#dropbox start -i (executar com outro usuario)
#dropbox autostart y
sleep 3

echo -e "\e[ \t\e[1;35;40m Instalacao e configurando o Skyline \e[0m"
wine /home/ahlr/Dropbox/NET4YOU/NET4YOU/Packages/Skyline.exe 
sed -i "s|^# Slackware|# Slackware x86_64|g" >> /home/ahlr/.wine/drive_c/skyline/wtcm.ini

wine /home/ahlr/.wine/drive_c/skyline/skyline.exe
mkdir -p /home/ahlr/.wine/drive_c/skyline/recebidos
chown ahlr -R /home/ahlr/.wine/
sleep 3

echo -e "\e[ \t\e[1;35;40m instalacao do driver da impressora \e[0m"
echo
./linux-brprinter-installer-2.1.1-1
sleep 3

echo -e "\e[ \t\e[1;35;40m Configurando local pt-BR \e[0m"
echo
sed -i "s/^#*/#/" /etc/profile.d/lang.sh
echo "#Local Português Brasileiro" >> /etc/profile.d/lang.sh
echo "export LINGUAS=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
echo "export LANGUAGE=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
echo "export LANG=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
echo "export LC_ALL=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
echo "export LESSCHARSET=latin1" >> /etc/profile.d/lang.sh
sed -i "s/^/#/g" /etc/profile.d/lang.csh
cat /etc/profile.d/lang.sh | grep ^export | sed -e "s/export/setenv/g" -e "s/\=/\ /g" >> /etc/profile.d/lang.csh
sleep 3
                                                                                  
echo "Compilando e Instalando pacotes"                            
sleep 3

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
echo -e "\e[ \t\e[1;35;40m Pacotes instalados e Configurações copiadas!! \e[0m"

else
echo -e "\e[ \t\e[1;31;40m Voce nao esta Conectado! \e[0m"

fi

else
    echo -e "\e[ \t\e[1;31;40m Logue-se como ROOT! \e[0m"

fi