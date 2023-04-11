#!/bin/bash
##
###
##################################################################################
# Autor: Antonio Henrique (Fela)                                                 #
# e-mail: ahlr_2000@yahoo.com                                                    #
# repositório: github.com/ahlrodrigues/slackonfig                                #
#                                                                                #
# Bugs, Agradecimentos, Críticas "construtivas"!                                 #
# Mande me um e-mail, que ficarei muito grato!                                   #
#                                                                                #
# Este scripts é disponibilizado na esperança que possa ser útil,                #
# mas SEM NENHUMA GARANTIA DE FUNCIONAMENTO, SEM NENHUMA GARANTIA DE ADEQUAÇÃO A #
# QUALQUER SISTEMA, SEM NENHUMA GARANTIA DE APLICAÇÃO EM PARTICULAR e NENHUM     #
# SUPORTE TÉCNICO.                                                               #
#                                                                                #
# Estes scripts/programas são softwares livres, você pode redistribuí-los e/ou   #
# modifica-los dentro dos termos da Licença Pública Geral GNU.                   #
#                                                                                #
# GNU General Public License:                                                    #
# [GPL](https://pt.wikipedia.org/wiki/GNU_General_Public_License)                #
# Fundação do Software Livre (FSF) Inc. 51 Franklin St, Fifth Floor,             #
# Boston, MA 02110-1301 USA                                                      #
##################################################################################
###
##
#
#
##
###
##################################################################################
#                                                                                #
# Script: Criação e edição de arquivos de configuração do Slackware GNU/Linux    #
#                                                                                #
# V0.2.5.1                                                                       #
#                                                                                #
# Last update: 2018/02/26                                                    #
#                                                                                #
##################################################################################
###
##
#
# PARA QUE O SCRIPT FUNCIONE TROCUE A VARIÁVEL slackonfig=off PARA slackonfig=on. Utilizado para aplicar funções pré configuradas.
slackonfig=on 

# Para ativar as funções deste script, troque as variábeis abaixo para "yes".
# Veja as funcões de cada script na página inicial do projeto slackonfig: https://github.com/ahlrodrigues/slackonfig
mlocal=no
cleanret=no       
mvrejsgr=no
cleansici=no
cleansai=no
cleancache=no
ntp=no
samba=no
cups=no
shutdown=no
teamviewerd=no
plex=no
mirrors=no
inittab=no
networkmanager=no
konsole=no
reccx=no
brother=yes
lang=no
thunderbackup=no
bblazetonico=no
bblazenet4you=no
data=no
winbox=no
cashflow=no
skyline=no
numLock=no
slackpkg=no
slackpkgplus=no
pkgs=no
hubiCNET4YOU=no
credhubiCNET4YOU=no
extetensionsff=no
multilib=no
sshbackup=no
gpg=no
# --------- Mensagens --------- #
mlocaltxt="$GREEN Configurando mirror local $NC"
aminilicensetxt="$GREEN Arquivo de licença a ser incluído nos spripts $NC"
apkgstxt="$GREEN Arquivo com lista de pacotes a serem instalados automaticamente $NC"
cleanrettxt="$GREEN Move os arquivos de retorno da caixa; $NC"
mvrejsgrtxt="$GREEN Move os arquivos de rejeitados e francesinha do BNB; $NC"
cleansicitxt="$GREEN Move os recibo de declaração do SICI para o Dropbox; $NC"
cleansaitxt="$GREEN Move os arquivos de retorno do bnb; $NC"
cleancachetxt="$GREEN Limpa o cache; $NC"
ntptxt="$GREEN Habilita o NTP pool server brasileiro; $NC"
sambatxt="$GREEN Configura o grupo de trabalho do Samba; $NC"
samba2txt="$GREEN Incluindo inicialização do deamon do Samba no rc.local; $NC"
cupstxt="$GREEN Inicializa o deamon do servidor de impressão CUPS; $NC"
shutdowntxt="$GREEN Cria o rc.local_shutdown para limpeza dos /tmp's no shutdown; $NC"
teamviewerdtxt="$GREEN Incluindo inicialização do daemon do teamviewer no rc.local; $NC"
plextxt="$GREEN Incluindo inicialização do daemon do Plex no rc.local; $NC"
mirrorstxt="$GREEN Administracao dos mirros locais; $NC"
inittabtxt="$GREEN Habilitando o init 4; $NC"
networkmanagertxt="$GREEN Inicialzando networkmanager; $NC"
konsoletxt="$GREEN Configura o profile do Konsole; $NC"
reccxtxt="$GREEN Cria pasta para os arquivos da CEF e dá permissão de usuário; $NC"
brothertxt="$GREEN instalacao do driver da impressora; $NC"
langtxt="$GREEN Configurando local pt-BR; $NC"
thunderbackuptxt="$GREEN Cria/Recupera backup do Thunderbird; $NC"
thunderbird="$GREEN Cria configurações do Thunderbird; $NC"
bblazetonicotxt="$GREEN Faz backup no Backblaze; $NC"
bblazenet4youtxt="$GREEN Faz backup no Backblaze; $NC"
datatxt="$GREEN Script de calculo data; $NC"
winboxtxt="$GREEN Cria a entrada do Winbox no menu do KDE; $NC"
cashflowtxt="$GREEN Cria a entrada do CashFlow no menu do KDE; $NC"
skylinetxt="$GREEN Cria a entrada do Skyline no menu do KDE; $NC"
numLocktxt="$GREEN Ativando o NumLock; $NC"
slackpkgtxt="$GREEN Instala e configura o slackpkg; $NC"
slackpkgplustxt="$GREEN Instala e configura slackpkgplus; $NC"
pkgstxt="$GREEN Instalacao da lista de pacotes; $NC"
hubiCNET4YOUtxt="$GREEN Faz backup no hubic; $NC"
credhubiCNET4YOUtxt="$GREEN Cria as credenciais da conta hubiC_NET4YOU; $NC"
#extetensionsfftxt="$GREEN Instalação de algumas extencoes do FF; $NC"
multilibtxt="$GREEN Aplica layer multilib; $NC"
sshbackuptxt="$GREEN Cria script de backup dos equipamentos mikrotik; $NC"
gpgtxt="$GREEN Configura o gpg-agent; $NC"
# --------- Caminhos mais usados  --------- #
crondaily=/etc/cron.daily
cronhourly=/etc/cron.hourly
minilicense=/tmp/minilicense.txt
lpkgs=/tmp/pkgs.txt
rcd=/etc/rc.d
ulbin=/usr/local/bin
usa=/usr/share/applications
blacklist=">> /etc/slackpkg/blacklist"
rawdocs=https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/docs
rawconfigs=https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/configs
imag="/home/ahlr/Dropbox/TONICO/Projetos/slackonfig/imgs"
drop=/home/ahlr/Dropbox

# --------- Limpa tudo --------- #
clear

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
Brown='\e[1;33m'
BBrown='\e[5;33m'
BLUE='\e[1;34m'
BBLUE='\e[5;34m'
PINK='\e[1;35m'
BPINK='\e[5;35m'
CYAN='\e[1;36m'
BCYAN='\e[5;36m'
WHITE='\e[1;37m'
BWHITE='\e[5;37m'
NC='\033[0m' # reset/no color

# --------- Teste se está logado como root --------- #
if [[ $(whoami) == "root" ]]; then

# --------- Teste se está conectado na internet --------- #
echo
echo
echo -e "$BRED $RED Testando conexão, aguarde... $NC"
echo
echo
  ping -q -c2 8.8.8.8 > /dev/null
  clear
    if [ $? -eq 0 ]; then
    
    echo
    echo
    echo -e "$CYAN Você está conectado! $NC"
    echo
    echo
    sleep 3
    clear

# --------- Baixando arquivos auxiliares no diretório /tmp --------- #

    echo
    echo
    echo -e "$RED Verificando se é necessários baixar arquivos auxiliare...: $NC"
    echo
    echo
    if [ ! -f "$minilicense" ]; then
	echo -e "$aminilicensetxt"
	wget -q  -nv -e robots=0 -r -nd -cP /tmp \
	$rawdocs/minilicense.txt
    else
	echo -e "$RED Arquivo $GREEN minilicense.txt $RED encontrado. $NC"
	sleep 5
    fi
       
clear


# --------- Testando configurações --------- #
	if [ $slackonfig == on ]; then
	
# --------- Checando funções --------- #
echo
echo
echo -e "$WHITE Vamos executar as seguintes funções do script: $NC"  
echo
	if [ $mlocal == yes ]; then
	  echo -e "$mlocaltxt"
	fi	
	
	if [ $cleanret == yes ]; then
	  echo -e "$cleanrettxt"
	fi
	
	if [ $mvrejsgr == yes ]; then
	  echo -e "$mvrejsgrtxt"
	fi
	
	if [ $cleansici == yes ]; then
	  echo -e "$cleansicitxt"
	fi
	
	if [ $cleansai == yes ]; then
	  echo -e "$cleansaitxt"
	fi
	
	if [ $cleancache == yes ]; then
	  echo -e "$cleancachetxt"
	fi
	
	if [ $ntp == yes ]; then
	  echo -e "$ntptxt"
	fi
	
	if [ $samba == yes ]; then
	  echo -e "$sambatxt"
	fi
		
		if [ $cups == yes ]; then
	  echo -e "$cupstxt"
	fi

	if [ $shutdown == yes ]; then
	  echo -e "$shutdowntxt"
	fi
	
	if [ $teamviewerd == yes ]; then
	  echo -e "$teamviewerdtxt"
	fi
	
	if [ $plex == yes ]; then
	  echo -e "$plextxt"
	fi

	if [ $mirrors == yes ]; then
	  echo -e "$mirrorstxt"
	fi

	if [ $inittab == yes ]; then
	  echo -e "$inittabtxt"
	fi
	
	if [ $networkmanager == yes ]; then
	  echo -e "$networkmanagertxt"
	fi
	
	if [ $konsole == yes ]; then
	  echo -e "$konsoletxt"
	fi
	
	if [ $reccx == yes ]; then
	  echo -e "$reccxtxt"
	fi
	
	if [ $brother == yes ]; then
	  echo -e "$brothertxt"
	fi
	
	if [ $lang == yes ]; then
	  echo -e "$langtxt"
	fi
	
	if [ $thunderbackup == yes ]; then
	  echo -e "$thunderbackuptxt"
	fi
# 	
# 	if [ $thunderbird == yes ]; then
# 	  echo -e "$thunderbirdtxt"
# 	fi
	
	if [ $bblazetonico == yes ]; then
	  echo -e "$bblazetonicotxt"
	fi
	
	if [ $bblazenet4you == yes ]; then
	  echo -e "$bblazenet4youtxt"
	fi

	if [ $data == yes ]; then
	  echo -e "$datatxt"
	fi
	
	if [ $winbox == yes ]; then
	  echo -e "$winboxtxt"
	fi
	
	if [ $cashflow == yes ]; then
	  echo -e "$cashflowtxt"
	fi
	
	if [ $skyline == yes ]; then
	  echo -e "$skylinetxt"
	fi

	if [ $numLock == yes ]; then
	  echo -e "$numLocktxt"
	fi

	if [ $slackpkg == yes ]; then
	  echo -e "$slackpkgtxt"
	fi
	
	if [ $slackpkgplus == yes ]; then
	  echo -e "$slackpkgplustxt"
	fi

	if [ $pkgs == yes ]; then
	  echo -e "$pkgstxt"
	fi

	if [ $hubiCNET4YOU == yes ]; then
	  echo -e "$hubiCNET4YOUtxt"
	fi

	if [ $extetensionsff == yes ]; then
	  echo -e "$extetensionsfftxt"
	fi	

	if [ $multilib == yes ]; then
	  echo -e "$multilibtxt"
	fi
	
	if [ $sshbackup == yes ]; then
	  echo -e "$sshbackuptxt"
	fi
	
	if [ $gpg == yes ]; then
	  echo -e "$gpgtxt"
	fi
# --------- Listando funções --------- #
	echo
	echo
	echo -e "$CYAN Deseja executar as funções acima? Posso continuar? [Y|N] $NC"

	 read RESPOSTA
	 case $RESPOSTA in
	 N|n) 
	 echo -e "$Brown Saindo!!! $NC"
	 echo
	 echo
	 exit;;
	
# --------- Texto 1 --------- #
	Y|y)echo
	echo
	echo -e "$Brown Criando todos os arquivos de configuração nas devidas pastas e executando processos de configuração $NC"
	echo
	echo	
	sleep 3
      

##########################################
#                                        #      
# --------- Início das Funções --------- #      
#                                        #      
#   Não editar a partir deste ponto      #      
#                                        #      
##########################################

# --------- Configurando slackpkg mirror local --------- #
        if [ $mlocal == yes ]; then
	echo -e "$mlocaltxt"
	echo -e "$BLUE Qual o caminho para o mirror local? Comece e termine com um "/" $NC"
	read caminho
	echo
	echo 
	echo -e "$BLUE file:/$caminho $NC"
	sed "/file:/{p;s/.*/file:/$caminho;}" /etc/slackpkg/mirrors
	fi 
	
if [ $thunderbackup == yes ]; then

clear
echo
echo
echo -e "$BLUE Escolha o que deseja fazer: $NC"
    echo
    echo -e "$GREEN [ 1 ] Copiar as configuracoes do Thunderbird para o Dropbox; $NC" 
    echo -e "$BLUE [ 2 ] Copiar as configuracoes do Thunderbird do Dropbox para o outra pasta; $NC" 
      read copiathunderbird
	case $copiathunderbird in
	    1 )
	    echo -e "$GREEN [ 1 ] Para copiar as configuracoes do Thunderbird para o Dropbox, preciso que você escreva o caminho da pasta de origem:  $NC"
	    echo
	    echo -e "$RED Não esqueça das barras $BCYAN $CYAN / $NC $RED no início e fim do daminho!!$NC"
	    echo
	    read origem
	    echo
	    echo
	    echo -e "$YELLOW rsync -azhv $GREEN $origem $drop/TONICO/Thunderbird $NC"
	   	;;
	    2 )
	    echo -e "$BLUE [ 2 ] Para copiar as configuracoes do Thunderbird para o outra pasta, preciso que você escreva o caminho da pasta de destino: $NC"
	    echo
	    echo -e "$RED Não esqueça das barras $BCYAN $CYAN / $NC $RED no início e fim do daminho!!$NC"
	    echo
	    read destino
	    echo
	    echo
	    echo -e "$YELLOW rsync -azhv $drop/TONICO/Thunderbird $BLUE $destino $NC"
		;;
	    *) 
	    echo
	    echo
	    echo -e "$BRED $RED Opção Inválida, saindo!!! $NC"
	    echo
	    echo
	    sleep 3
	    clear
	    echo
	    echo
	    echo -e "$BLUE Tente novamente, observe as opções disponíveis $NC"
	    echo
	    echo
		;;
	esac
fi

# Criar script que move os arquivos da CEF
if [ $cleanret == yes ]; then
    echo -e "$cleanrettxt"
    echo "#!"$SHELL > $crondaily/cleanret.sh
    cat $minilicense >> $crondaily/cleanret.sh
    echo "#" >> $crondaily/cleanret.sh
    echo "pasta_origem=/home/ahlr/Downloads" >> $crondaily/cleanret.sh
    echo "pasta_retorno=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/CX/Retornos/" >> $crondaily/cleanret.sh
    echo "pasta_remessa=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/CX/Remessa" >> $crondaily/cleanret.sh
    echo "#" >> $crondaily/cleanret.sh
    echo "#" >> $crondaily/cleanret.sh
    pasta_retorno=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/CX/Retornos
    pasta_remessa=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/CX/Remessa
      if [ ! -d $pasta_retorno ]; then
	mkdir /home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/CX/Retornos/
      fi
      if [ ! -d $pasta_remessa ]; then
	mkdir /home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/CX/Remessa/
      fi
    echo "mv \$pasta_origem/*.ret \$pasta_retorno" >> $crondaily/cleanret.sh
    echo "mv \$pasta_origem/*.rem \$pasta_remessa" >> $crondaily/cleanret.sh
    chmod +x $crondaily/cleanret.sh
    chmod 755 $crondaily/cleanret.sh
    sleep 3
fi

# Criar script que move os arquivos de Rejeitado e Francesinha do BNB
# para uma pasta de backup no diretório /opt/caixa/Recebidos.
if [ $mvrejsgr == yes ]; then
    echo -e "$mvrejsgrtxt"
    echo "#!"$SHELL > $crondaily/mvrejsgr.sh
    cat $minilicense >> $crondaily/mvrejsgr.sh
    echo "#" >> $crondaily/mvrejsgr.sh
    echo "# Cria variáveis" >> $crondaily/mvrejsgr.sh
    echo "pasta_origem=/home/ahlr/Downloads" >> $crondaily/mvrejsgr.sh
    echo "pasta_destino=$drop/NET4YOU/NET4YOU/Bancos/BNB/Arquivos" >> $crondaily/mvrejsgr.sh
    echo "#" >> $crondaily/mvrejsgr.sh
    echo "# Renomeia os arquivos" >> $crondaily/mvrejsgr.sh
    echo "mv \$pasta_origem/rel*.pdf  \$pasta_origem/Rejeitados-\`"date +\"%F\""\`.pdf 2> /dev/null" >> $crondaily/mvrejsgr.sh
    echo "mv \$pasta_origem/sgr*.pdf  \$pasta_origem/Francesinha-\`"date +\"%F\""\`.pdf 2> /dev/null" >> $crondaily/mvrejsgr.sh
    echo "#" >> $crondaily/mvrejsgr.sh
    echo "# Move os arquivos da pasta ../Downloads para a pasta ../BNB/Arquivos" >> $crondaily/mvrejsgr.sh
    echo "mv \$pasta_origem/Francesinha*.pdf \$pasta_destino 2> /dev/null" >> $crondaily/mvrejsgr.sh
    echo "mv \$pasta_origem/Rejeitados*.pdf \$pasta_destino 2> /dev/null" >> $crondaily/mvrejsgr.sh
    chmod +x $crondaily/mvrejsgr.sh
    chmod 755 $crondaily/mvrejsgr.sh
    sleep 3
fi

# Criar script que move o recibo de entrehga do SICI
#  para a pasta de backup ../SCM/SICI.
if [ $cleansici == yes ]; then
    echo -e "$cleansicitxt"
    echo "#!"$SHELL > $crondaily//cleansici.sh
    cat $minilicense >> $crondaily/cleansici.sh
    echo "#Mover os arquivos declaração do SICI para a pasta $drop/NET4YOU/NET4YOU/SCM/SICI" >> $crondaily/cleansici.sh
    echo "#" >> $crondaily/cleansici.sh
    echo "# Cria variáveis" >> $crondaily/cleansici.sh
    echo "pasta_origem=/home/ahlr/Downloads" >> $crondaily/cleansici.sh
    echo "pasta_destino=$drop/NET4YOU/NET4YOU/SCM/SICI" >> $crondaily/cleansici.sh
    echo "#" >> $crondaily/cleansici.sh
    echo "# Move o recibo de entrehga do SICI para a pasta de backup ../SCM/SICI" >> $crondaily/cleansici.sh
    echo "mv \$pasta_origem/sici*.xml \$pasta_destino 2> /dev/null" >> $crondaily/cleansici.sh
    chmod +x $crondaily/cleansici.sh
    chmod 755 $crondaily/cleansici.sh
    sleep 3
fi

# Criar script que move o arquivo de retornodo BNB para a pasta ../skyline/recebidos
 if [ $cleansai == yes ]; then
    echo -e "$cleansaitxt"
    echo "#!"$SHELL > $crondaily/cleansai.sh
    cat $minilicense >> $crondaily/cleansai.sh
    echo "#Move arquivos de retorno do BNB" >> $crondaily/cleansai.sh
    echo "#" >> $crondaily/cleansai.sh
    echo "#Cria as variáveis" >> $crondaily/cleansai.sh
    echo "pasta_origem=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/BNB/skyline/inbox/" >> $crondaily/cleansai.sh
    echo "pasta_destino=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/BNB/skyline/recebidos/" >> $crondaily/cleansai.sh
    echo "#" >> $crondaily/cleansai.sh
    echo "#Cria a pasta ../skyline/recebidos para backup" >> $crondaily/cleansai.sh
    echo "#dos arquivos de retorno do BNB" >> $crondaily/cleansai.sh
#    if  [ ! -d "
    echo "mkdir /home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/BNB/skyline/recebidos/" >> $crondaily/cleansai.sh
    echo "#" >> $crondaily/cleansai.sh
    echo "#Copia os arquivos de retorno para a pasta de backup" >> $crondaily/cleansai.sh
    echo "mv \$pasta_origem/*.SAI \$pasta_destino" >> $crondaily/cleansai.sh
    chmod +x $crondaily/cleansai.sh
    chmod 755 $crondaily/cleansai.sh
    sleep 3
fi

# Criar script que limpa o cache todos os dias no horário do crontab
if [ $cleancache == yes ]; then	
    echo -e "$cleancachetxt"
    echo "#!"$SHELL > $crondaily/cleancache.sh
    cat $minilicense >> $crondaily/cleancache.sh
    echo "#Apaga o cache" >> $crondaily/cleancache.sh
    echo "#" >> $crondaily/cleancache.sh
    echo "#Move tudo para o lixo" >> $crondaily/cleancache.sh
    echo "echo 3 > /proc/sys/vm/drop_caches" >> $crondaily/cleancache.sh
    chmod +x $crondaily/cleancache.sh
    chmod 755 $crondaily/cleancache.sh
    sleep 3
fi

# Configura o servidor NTP Brasileiro
if [ $ntp == yes ]; then	
    echo -e "$ntptxt"
    sed -i "s/^#*/#/" /etc/ntp.conf # --------- comenta todas as linhas --------- #	
    sed -i "s/#server 3.pool.ntp.org/server pool.ntp.br/g" /etc/ntp.conf
    	if [ -x $rcd/rc.ntpd ]; then
	  chmod +x $rcd/rc.ntpd
	  $rcd/rc.ntpd start
	fi
    sleep 3
fi

# Configura o servidor de compartilhamento de aquivos Samba
if [ $samba == yes ]; then
    echo -e "$sambatxt"
    sed -i "s/MYGROUP/workgroup/g" /etc/samba/smb.conf-sample
    mv /etc/samba/smb.conf-sample /etc/samba/smb.conf
    sleep 3
    echo -e "$samba2txt"
    if [ -x $rcd/rc.samba ]; then
	chmod +x $rcd/rc.samba
	$rcd/rc.samba start
    fi
    sleep 3
fi

# Inicia o servidor de impressão CUPS
if [ $cups == yes ]; then
    echo -e "$cupstxt"
    if [ -x $rcd/rc.cups ]; then
	chmod +x $rcd/rc.cups
	$rcd/$rcd/rc.cups start
    fi
    sleep 3
fi

# Limpa os diretórios /tmp a cada shutdown
if [ $shutdown == yes ]; then
    echo -e "$shutdowntxt"
    echo "#!"$SHELL > $rcd/rc.local_shutdown
    cat $minilicense >> $rcd/rc.local_shutdown
    echo "Limpeza geram nos diretórios temporários" >> $rcd/rc.local_shutdown
    echo "cd /tmp && rm -rf -- *[!"ahlr"]* 2>/dev/null" >> $rcd/rc.local_shutdown
    echo "cd /var/tmp && rm -rf * 2>/dev/null" >> $rcd/rc.local_shutdown
    echo "/usr/bin/find /tmp -mindepth 1 -maxdepth 1 -exec /bin/rm -rf {} +;" >> $rcd/rc.local_shutdown
    echo "find /tmp/lost+found -exec /bin/touch {} \;" >> $rcd/rc.local_shutdown
    echo "find /tmp -type s -exec  /bin/touch {} \;" >> $rcd/rc.local_shutdown
    echo "find /tmp -type d -empty -mtime +37 -exec /bin/rmdir {} \;" >> $rcd/rc.local_shutdown
    echo "find /tmp -type f -mtime +37 -exec rm -rf {} \; " >> $rcd/rc.local_shutdown
    chmod +x $rcd/rc.local_shutdown
    sleep 3
fi

# Iniciando do deamon Teamviewer
if [ $teamviewerd == yes ]; then	
    echo -e "$teamviewerdtxt"
    echo
    echo "Testando se o Teamviewer esta instalado"
    if [ ! -f "$rcd/rc.teamviewerd" ]; then
    echo
    echo "O Teamviewer nao esta instalado, reealizando Configurações"
    echo
    exit
    elso
    echo "#Inicializando o deamon rc.teamviewerd" >> $rcd/rc.local
    echo "if [ -x $rcd/rc.teamviewerd ]; then" >> $rcd/rc.local
    echo "$rcd/rc.teamviewerd start" >> $rcd/rc.local
    echo "fi" >> $rcd/rc.local
    chmod +x $rcd/rc.teamviewerd
    $rcd/rc.teamviewerd start
    sleep 3
    fi
fi

#Iniciando do deamon Plex
if [ $plex == yes ]; then
    echo -e "$plextxt"
    echo "#Inicializando o deamon rc.teamviewerd" >> $rcd/rc.local
    echo "if [ -x $rcd/rc.plexmediaserver ]; then" >> $rcd/rc.local
    echo "$rcd/rc.plexmediaserver start" >> $rcd/rc.local
    echo "fi" >> $rcd/rc.local
    chmod +x $rcd/rc.plexmediaserver
    $rcd/rc.plexmediaserver start
    sleep 3
fi

# Baixa o script do AlienBob e configura para mirrors locais x86 e x86_64 
if [ $mirrors == yes ]; then
    echo -e "$mirrorstxt"
    wget -q  -nv -e robots=0 -r -nd -cP $crondaily http://www.slackware.com/~alien/tools/mirror-slackware-current.sh
    sed -i "s|BUILDER:-\"Eric Hameleers <alien@slackware.com>\"|BUILDER:-\"Fela  <ahlr_2000@yahoo.com>\"|g" $crondaily/mirror-slackware-current.sh
    sed -i "s|/home/ftp/pub/Linux/Slackware|$caminho|g" $crondaily/mirror-slackware-current.sh
    sed -i "s|VERBOSE:-\"-q\"|VERBOSE:-\"-v --progress\"|g" $crondaily/mirror-slackware-current.sh
    sed -i "s|ISO:-\"CDROM\"}|ISO:-\"DVD\"}|g" $crondaily/mirror-slackware-current.sh
    sed -i "s|EXCLUDES:-\"--exclude pasture\"|EXCLUDES:-\"--exclude pasture --exclude source\"|g" $crondaily/mirror-slackware-current.sh
    sed -i "s|DVD_EXCLUDES:-\"-x ./testing  -x ./source -x ./extra/source\"|DVD_EXCLUDES:-\"-x ./source -x ./extra/source\"|g" $crondaily/mirror-slackware-current.sh
    sed -i "s|ARCH:-\"x86\"|ARCH:-\"x86_64\"|g" $crondaily/mirror-slackware-current.sh
    mv $crondaily/mirror-slackware-current.sh $crondaily/mirror-slackware64-current.sh
    chmod +x $crondaily/mirror-slackware*
    sleep 3
fi

# Cria o script de rsync do port ARM
if [ $mirrors == yes ]; then
    echo -e "$mirrorstxt"
    echo "#!"$SHELL > $crondaily/mirror-slackwarearm-current.sh
    cat $minilicense >> $crondaily/mirror-slackwarearm-current.sh
    echo "cd /mnt/sda3/Slackware/" > $crondaily/mirror-slackwarearm-current.sh
    echo "rsync -Prv --delete ftp.slackware.uk::slackwarearm/slackwarearm-current ." > $crondaily/mirror-slackwarearm-current.sh
    echo "#" > $crondaily/mirror-slackwarearm-current.sh
    echo "mkisofs \\" > $crondaily/mirror-slackwarearm-current.sh
    echo "-udf \\" > $crondaily/mirror-slackwarearm-current.sh
    echo "-o /mnt/sda3/Slackware/Slackwarearm-current-iso/slackwarearm-DVD.iso \\" > $crondaily/mirror-slackwarearm-current.sh
    echo "-R -J -V "Slackware ARM current" \\" > $crondaily/mirror-slackwarearm-current.sh
    echo "-hide-rr-moved \\" > $crondaily/mirror-slackwarearm-current.sh
    echo "-v -d -N \\" > $crondaily/mirror-slackwarearm-current.sh
    echo "-A "Slackware ARM DVD" ." > $crondaily/mirror-slackwarearm-current.sh
    chmod +x $crondaily/mirror-slackwarearm*
    sleep 3
fi

# Configura a inicialização do sistema em init 4
if [ $inittab == yes ]; then
    echo -e "$inittabtxt"
    sed -i "s/id:3/id:4/g" /etc/inittab
    sleep 3
fi

# Iniciando do deamon networkmanager  
if [ $networkmanager == yes ]; then
    echo -e "$networkmanagertxt"
    echo "#Inicializando o deamon rc.networkmanager" >> $rcd/rc.local
    echo "if [ -x $rcd/rc.networkmanager ]; then" >> $rcd/rc.local
    echo "$rcd/rc.networkmanager start" >> $rcd/rc.local
    echo "fi" >> $rcd/rc.local
    echo "#" >> $rcd/rc.local
    chmod +x $rcd/rc.networkmanager >> $rcd/rc.local
    sleep 3
fi

# Configura o profile do Konsole
if [ $konsole == yes ]; then
    echo -e "$konsoletxt"
    if [ -f "/home/ahlr/.kde/share/apps/konsole/Shell.profile" ]; then
    sed -i "s/bin\/bash/bin\/bash -l/g" /home/ahlr/.kde/share/apps/konsole/Shell.profile
    else
    echo "[General]" > /home/ahlr/.kde/share/apps/konsole/Shell.profile
    echo "Command=/bin/bash -l" >> /home/ahlr/.kde/share/apps/konsole/Shell.profile
    echo "Name=Shell" >> /home/ahlr/.kde/share/apps/konsole/Shell.profile
    echo "Parent=FALLBACK/" >> /home/ahlr/.kde/share/apps/konsole/Shell.profile
    fi
    sleep 3
fi

if [ $reccx == yes ]; then
    echo -e "$reccxtxt"
    mkdir -p /opt/caixa/Recebidos
    chmod -R 777 /opt/caixa
    sleep 3
fi

# Instalação do driver da impressora
if [ $brother == yes ]; then
    echo -e "$brothertxt"
    wget -cP /tmp http://download.brother.com/welcome/dlf006893/linux-brprinter-installer-2.2.0-1.gz
    gunzip /tmp/linux-brprinter-installer*
    cd /tmp
    chmod +x linux-brprinter-installer*
    ./linux-brprinter-installer*
    rm /tmp/linux-brprinter-installer*
    rm /tmp/uninstaller_*
    rm /tmp/brscan*
    rm /tmp/cupswr*
    rm /tmp/dcp7065*
    sleep 3
fi

# Configura o idioma pt_BR no sistema 
if [ $lang == yes ]; then
    echo -e "$langtxt"
    sed -i "s/^#*/#/" /etc/profile.d/lang.sh # --------- comenta todas as linhas --------- #	
    echo "#Local Português Brasileiro" >> /etc/profile.d/lang.sh
    echo "export LINGUAS=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
    echo "export LANGUAGE=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
    echo "export LANG=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
    echo "export LC_ALL=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
    echo "export LESSCHARSET=latin1" >> /etc/profile.d/lang.sh
    sed -i "s/^/#/g" /etc/profile.d/lang.csh
    cat /etc/profile.d/lang.sh | grep ^export | sed -e "s/export/setenv/g" -e "s/\=/\ /g" >> /etc/profile.d/lang.csh
    sleep 3
fi

#Criação do arquivo thunderbirdbackup.sh
if [ $thunderbackup == yes ]; then
    if [ $copiathunderbird -eq 1 ]; then
    echo "#!"$SHELL > $crondaily/thunderbirdbackup.sh
    cat $minilicense >> $crondaily/thunderbirdbackup.sh
    echo "#Faz cópia incremental do diretório de configurações do Thunderbird." >> $crondaily/thunderbirdbackup.sh
    echo "rsync -azhv $origem $drop/TONICO/Thunderbird" >> $crondaily/thunderbirdbackup.sh
    echo
    echo
    echo -e "$GREEN Configuração realizada! $NC"
    echo
    echo
    fi
    if [ $copiathunderbird -eq 2 ]; then
    echo "#!"$SHELL > $crondaily/thunderbirdbackup.sh
    cat $minilicense >> $crondaily/thunderbirdbackup.sh
    echo "#Faz cópia incremental do diretório de configurações do Thunderbird." >> $crondaily/thunderbirdbackup.sh
    echo
    echo
    echo "rsync -azhv $drop/TONICO/Thunderbird $destino" >> $crondaily/thunderbirdbackup.sh
    echo
    echo
    echo -e "$GREEN Configuração realizada! $NC"
    echo
    echo
    chmod +x $crondaily/thunderbirdbackup.sh
    chmod 755 $crondaily/thunderbirdbackup.sh   
    fi
fi

#Criação do arquivo backblaze_TONICO.sh
if [ $bblazetonico == yes ]; then
    echo -e "$bblazetonicotxt"
    echo "#!"$SHELL > $crondaily/backblaze_TONICO.sh
    cat $minilicense >> $crondaily/backblaze_TONICO.sh
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
    echo "   #Ajustando permissões" >> $crondaily/backblaze_TONICO.sh
    echo "   echo" >> $crondaily/backblaze_TONICO.sh
    echo "   echo" >> $crondaily/backblaze_TONICO.sh
    echo "   echo -e "'"$RED Ajustando as permissões dos dados... aguarde... $NC"'"" >> $crondaily/backblaze_TONICO.sh
    echo "   echo" >> $crondaily/backblaze_TONICO.sh
    echo "   echo" >> $crondaily/backblaze_TONICO.sh
    echo "" >> $crondaily/backblaze_TONICO.sh
    echo "   find $drop/TONICO/ -type f -exec chmod 644 {} \;" >> $crondaily/backblaze_TONICO.sh
    echo "   find $drop/TONICO/ -type d -exec chmod 755 {} \;" >> $crondaily/backblaze_TONICO.sh
    echo "" >> $crondaily/backblaze_TONICO.sh
    echo "   #B2 configuration variables" >> $crondaily/backblaze_TONICO.sh
    echo "   B2_ACCOUNT="cd0c87d370b7"" >> $crondaily/backblaze_TONICO.sh
    echo "   B2_KEY="0010db1dde3b5edd54f9890392d42d089c782a4457"" >> $crondaily/backblaze_TONICO.sh
    echo "   B2_BUCKET="TONICO"" >> $crondaily/backblaze_TONICO.sh
    echo "   B2_DIR=""" >> $crondaily/backblaze_TONICO.sh
    echo "" >> $crondaily/backblaze_TONICO.sh
    echo "   # Local directory to backup" >> $crondaily/backblaze_TONICO.sh
    echo "   LOCAL_DIR="$drop/TONICO/"" >> $crondaily/backblaze_TONICO.sh
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
    echo "   b2://\${B2_ACCOUNT}:\${B2_KEY}@\${B2_BUCKET}" >> $crondaily/backblaze_TONICO.sh
    echo "" >> $crondaily/backblaze_TONICO.sh
    echo "   # Perform the backup, make a full backup if it's been over 30 days" >> $crondaily/backblaze_TONICO.sh
    echo "   duplicity \\" >> $crondaily/backblaze_TONICO.sh
    echo "   --sign-key \$SGN_KEY --encrypt-key \$ENC_KEY \\" >> $crondaily/backblaze_TONICO.sh
    echo "   --full-if-older-than 30D \\" >> $crondaily/backblaze_TONICO.sh
    echo "   \${LOCAL_DIR} b2://\${B2_ACCOUNT}:\${B2_KEY}@\${B2_BUCKET}" >> $crondaily/backblaze_TONICO.sh
    echo "" >> $crondaily/backblaze_TONICO.sh
    echo "   # Cleanup failures" >> $crondaily/backblaze_TONICO.sh
    echo "   duplicity \\" >> $crondaily/backblaze_TONICO.sh
    echo "   cleanup --force \\" >> $crondaily/backblaze_TONICO.sh
    echo "   --sign-key $SGN_KEY --encrypt-key $ENC_KEY \\" >> $crondaily/backblaze_TONICO.sh
    echo "   b2://\${B2_ACCOUNT}:${B2_KEY}@\${B2_BUCKET}" >> $crondaily/backblaze_TONICO.sh
    echo "" >> $crondaily/backblaze_TONICO.sh
    echo "   # Show collection-status" >> $crondaily/backblaze_TONICO.sh
    echo "   duplicity collection-status \\" >> $crondaily/backblaze_TONICO.sh
    echo "   --sign-key \$SGN_KEY --encrypt-key \$ENC_KEY \\" >> $crondaily/backblaze_TONICO.sh
    echo "   b2://\${B2_ACCOUNT}:\${B2_KEY}@\${B2_BUCKET}" >> $crondaily/backblaze_TONICO.sh
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
    chmod +x $crondaily/backblaze_TONICO.sh
    chmod 755 $crondaily/backblaze_TONICO.sh
fi

#Criação do arquivo backblaze_NET4YOU.sh
if [ $bblazenet4you == yes ]; then
    echo -e "$bblazenet4youtxt"
    echo "#!"$SHELL > $crondaily/backblaze_NET4YOU.sh
    cat $minilicense >> $crondaily/backblaze_NET4YOU.sh
    echo "clear" >> $crondaily/backblaze_NET4YOU.sh
    echo "" >> $crondaily/backblaze_NET4YOU.sh
    echo "if [[ \$(whoami) == "ahlr" ]]; then" >> $crondaily/backblaze_NET4YOU.sh
    echo "" >> $crondaily/backblaze_NET4YOU.sh
    echo "   echo" >> $crondaily/backblaze_NET4YOU.sh
    echo "   echo" >> $crondaily/backblaze_NET4YOU.sh
    echo "   echo -e "'"$RED Troque de usuário, o ROOT não pode executar backups $NC"'"" >> $crondaily/backblaze_NET4YOU.sh
    echo "   echo" >> $crondaily/backblaze_NET4YOU.sh
    echo "   echo" >> $crondaily/backblaze_NET4YOU.sh
    echo "   exit 0" >> $crondaily/backblaze_NET4YOU.sh
    echo "   else" >> $crondaily/backblaze_NET4YOU.sh
    echo "" >> $crondaily/backblaze_NET4YOU.sh
    echo "   #Ajustando permissões" >> $crondaily/backblaze_NET4YOU.sh
    echo "   echo" >> $crondaily/backblaze_NET4YOU.sh
    echo "   echo" >> $crondaily/backblaze_NET4YOU.sh
    echo "   echo -e "'"$RED Ajustando as permissões dos dados... aguarde... $NC"'"" >> $crondaily/backblaze_NET4YOU.sh
    echo "   echo" >> $crondaily/backblaze_NET4YOU.sh
    echo "   echo" >> $crondaily/backblaze_NET4YOU.sh
    echo "" >> $crondaily/backblaze_NET4YOU.sh
    echo "   find $drop/NET4YOU/ -type f -exec chmod 644 {} \;" >> $crondaily/backblaze_NET4YOU.sh
    echo "   find $drop/NET4YOU/ -type d -exec chmod 755 {} \;" >> $crondaily/backblaze_NET4YOU.sh
    echo "" >> $crondaily/backblaze_NET4YOU.sh
    echo "   #B2 configuration variables" >> $crondaily/backblaze_NET4YOU.sh
    echo "   B2_ACCOUNT="d258ec9a83fb"" >> $crondaily/backblaze_NET4YOU.sh
    echo "   B2_KEY="001c5d99a010da54e85dee2bea586639a95da7b7f1"" >> $crondaily/backblaze_NET4YOU.sh
    echo "   B2_BUCKET="NET4YOU"" >> $crondaily/backblaze_NET4YOU.sh
    echo "   B2_DIR=""" >> $crondaily/backblaze_NET4YOU.sh
    echo "" >> $crondaily/backblaze_NET4YOU.sh
    echo "   # Local directory to backup" >> $crondaily/backblaze_NET4YOU.sh
    echo "   LOCAL_DIR="$drop/NET4YOU/"" >> $crondaily/backblaze_NET4YOU.sh
    echo "" >> $crondaily/backblaze_NET4YOU.sh
    echo "   # GPG key (last 8 characters)" >> $crondaily/backblaze_NET4YOU.sh
    echo "   ENC_KEY="A2133DA2"" >> $crondaily/backblaze_NET4YOU.sh
    echo "   SGN_KEY="A2133DA2"" >> $crondaily/backblaze_NET4YOU.sh
    echo "   export PASSPHRASE="xxxxxxxxxxxxxx"" >> $crondaily/backblaze_NET4YOU.sh
    echo "   export SIGN_PASSPHRASE="xxxxxxxxxxxxxx"" >> $crondaily/backblaze_NET4YOU.sh
    echo "" >> $crondaily/backblaze_NET4YOU.sh
    echo "   # Remove files older than 90 days" >> $crondaily/backblaze_NET4YOU.sh
    echo "   duplicity \\" >> $crondaily/backblaze_NET4YOU.sh
    echo "   --sign-key \$SGN_KEY --encrypt-key \$ENC_KEY \\" >> $crondaily/backblaze_NET4YOU.sh
    echo "   remove-older-than 90D --force \\" >> $crondaily/backblaze_NET4YOU.sh
    echo "   b2://\${B2_ACCOUNT}:\${B2_KEY}@\${B2_BUCKET}" >> $crondaily/backblaze_NET4YOU.sh
    echo "" >> $crondaily/backblaze_NET4YOU.sh
    echo "   # Perform the backup, make a full backup if it's been over 30 days" >> $crondaily/backblaze_NET4YOU.sh
    echo "   duplicity \\" >> $crondaily/backblaze_NET4YOU.sh
    echo "   --sign-key \$SGN_KEY --encrypt-key \$ENC_KEY \\" >> $crondaily/backblaze_NET4YOU.sh
    echo "   --full-if-older-than 30D \\" >> $crondaily/backblaze_NET4YOU.sh
    echo "   \${LOCAL_DIR} b2://\${B2_ACCOUNT}:\${B2_KEY}@\${B2_BUCKET}" >> $crondaily/backblaze_NET4YOU.sh
    echo "" >> $crondaily/backblaze_NET4YOU.sh
    echo "   # Cleanup failures" >> $crondaily/backblaze_NET4YOU.sh
    echo "   duplicity \\" >> $crondaily/backblaze_NET4YOU.sh
    echo "   cleanup --force \\" >> $crondaily/backblaze_NET4YOU.sh
    echo "   --sign-key $SGN_KEY --encrypt-key $ENC_KEY \\" >> $crondaily/backblaze_NET4YOU.sh
    echo "   b2://\${B2_ACCOUNT}:${B2_KEY}@\${B2_BUCKET}" >> $crondaily/backblaze_NET4YOU.sh
    echo "" >> $crondaily/backblaze_NET4YOU.sh
    echo "   # Show collection-status" >> $crondaily/backblaze_NET4YOU.sh
    echo "   duplicity collection-status \\" >> $crondaily/backblaze_NET4YOU.sh
    echo "   --sign-key \$SGN_KEY --encrypt-key \$ENC_KEY \\" >> $crondaily/backblaze_NET4YOU.sh
    echo "   b2://\${B2_ACCOUNT}:\${B2_KEY}@\${B2_BUCKET}" >> $crondaily/backblaze_NET4YOU.sh
    echo "" >> $crondaily/backblaze_NET4YOU.sh
    echo "   # Unset variables" >> $crondaily/backblaze_NET4YOU.sh
    echo "   unset B2_ACCOUNT" >> $crondaily/backblaze_NET4YOU.sh
    echo "   unset B2_KEY" >> $crondaily/backblaze_NET4YOU.sh
    echo "   unset B2_BUCKET" >> $crondaily/backblaze_NET4YOU.sh
    echo "   unset B2_DIR" >> $crondaily/backblaze_NET4YOU.sh
    echo "   unset LOCAL_DIR" >> $crondaily/backblaze_NET4YOU.sh
    echo "   unset ENC_KEY" >> $crondaily/backblaze_NET4YOU.sh
    echo "   unset SGN_KEY" >> $crondaily/backblaze_NET4YOU.sh
    echo "   unset PASSPHRASE" >> $crondaily/backblaze_NET4YOU.sh
    echo "   unset SIGN_PASSPHRASE" >> $crondaily/backblaze_NET4YOU.sh 
    echo "fi" >> $crondaily/backblaze_NET4YOU.sh
    chmod +x $crondaily/backblaze_NET4YOU.sh
    chmod 755 $crondaily/backblaze_NET4YOU.sh
fi

# Cria script que calcula valor do boleto entre duas datas
if [ $data == yes ]; then
    echo -e "$datatxt"
    echo "#!"$SHELL > $ulbin/data.sh
    cat $minilicense >> $ulbin/data.sh
    echo "#Converte o formato 'dd/mm/AAAA' para 'AAAAmmdd' que e o aceito pela" >> $ulbin/data.sh
    echo "#opcao '-d' do comando date" >> $ulbin/data.sh
    echo "data_inicial=\`echo \"\$1\" | sed 's:\(..\)/\(..\)/\(....\):\3\2\1:'\`" >> $ulbin/data.sh
    echo "data_final=\`echo \"\$2\" | sed 's:\(..\)/\(..\)/\(....\):\3\2\1:'\`" >> $ulbin/data.sh
    echo "#" >> $ulbin/data.sh
    echo "#Cria a variável do valor da mensalidade" >> $ulbin/data.sh
    echo "valor_mensalidade=\"\$3\"" >> $ulbin/data.sh
    echo "#" >> $ulbin/data.sh
    echo "#Converte a data para o formato timestamp que e mais preciso" >> $ulbin/data.sh
    echo "data_inicial=\`date -d \"\$data_inicial\" \"+%s\"\`" >> $ulbin/data.sh
    echo "data_final=\`date -d \"\$data_final\" \"+%s\"\`" >> $ulbin/data.sh
    echo "dias_corridos=\$(((\$data_final - \$data_inicial) / 86400))" >> $ulbin/data.sh
    echo "#" >> $ulbin/data.sh
    echo "# Calculo do valor proporcional" >> $ulbin/data.sh
    echo "echo \"scale = 4; \$valor_mensalidade / 30 * \$dias_corridos\" | bc" >> $ulbin/data.sh
    echo "#" >> $ulbin/data.sh
    echo "exit 1" >> $ulbin/data.sh
    chmod +x $ulbin/data.sh
    chmod 755 $ulbin/data.sh
    sleep 3
fi  

#Criação do arquivo winbox.desktop
if [ $winbox == yes ]; then
    echo -e "$winboxtxt"
    echo "[Desktop Entry]" > $usa/winbox.desktop
    echo "Exec=wine $drop/NET4YOU/NET4YOU/Packages/winbox.exe" >> $usa/winbox.desktop
    echo "GenericName=Winbox" >> $usa/winbox.desktop
    echo "Icon=$drop/NET4YOU/NET4YOU/Imagens/winbox.png" >> $usa/winbox.desktop
    echo "Name=Permite acesso ao Servidor" >> $usa/winbox.desktop
    echo "Categories=Network;" >> $usa/winbox.desktop
    echo "NoDisplay=false" >> $usa/winbox.desktop
    echo "StartupNotify=true" >> $usa/winbox.desktop
    echo "Terminal=0" >> $usa/winbox.desktop
    echo "X-KDE-SubstituteUID=false" >> $usa/winbox.desktop
    update-desktop-database -q
    sleep 3
fi

#Criação do arquivo cashflow.desktop
if [ $cashflow == yes ]; then
    echo -e "$cashflowtxt"
    echo "[Desktop Entry]" > $usa/cashflow.desktop
    echo "Exec=libreoffice $drop/NET4YOU/NET4YOU/Finanças/CASHFLOW.ods" >> $usa/cashflow.desktop
    echo "GenericName=CashFlow" >> $usa/cashflow.desktop
    echo "Icon=$imag/cashflow.jpg" >> $usa/cashflow.desktop
    echo "Name=Planilha CashFlow" >> $usa/cashflow.desktop
    echo "Categories=Office;" >> $usa/cashflow.desktop
    echo "NoDisplay=false" >> $usa/cashflow.desktop
    echo "StartupNotify=true" >> $usa/cashflow.desktop
    echo "Terminal=0" >> $usa/cashflow.desktop
    echo "X-KDE-SubstituteUID=false" >> $usa/cashflow.desktop
    update-desktop-database -q
    sleep 3
fi

#Criação do arquivo bnb.desktop
if [ $skyline == yes ]; then
    echo -e "$skylinetxt"
    echo "[Desktop Entry]" > $usa/bnb.desktop
    echo "Exec=/usr/local/bin/bnb.sh" >> $usa/bnb.desktop
    echo "GenericName=BNB" >> $usa/bnb.desktop
    echo "Icon=$img/winbox.png" >> $usa/bnb.desktop
    echo "Name=Comunicação da cobrança BNB" >> $usa/bnb.desktop
    echo "Categories=Network;" >> $usa/bnb.desktop
    echo "NoDisplay=false" >> $usa/bnb.desktop
    echo "StartupNotify=true" >> $usa/bnb.desktop
    echo "Terminal=1" >> $usa/bnb.desktop
    echo "X-KDE-SubstituteUID=false" >> $usa/bnb.desktop
    update-desktop-database -q
    sleep 3
fi     
      
# Ativa tecla NumLock antes do login
if [ $numLock == yes ]; then
    echo -e "$numLocktxt"
    echo "Ativa o NumLock"
    sed -i "s/#NumLock=Off/NumLock=On/" /etc/kde/kdm/kdmrc
    sleep 3
fi
	
# if [ $extetensionsff == yes ]; then
#     echo -e "$extetensionsfftxt"
#     firefox https://addons.mozilla.org/firefox/downloads/file/430447/brazilian_portuguese_dictionary_new_spelling-47.20160418-sm+tb+fx.xpi?src=dp-btn-primary
#     firefox https://addons.mozilla.org/firefox/downloads/file/770952/interface_portuguesbrasil_pt_br-57.0-fx.xpi?src=dp-btn-primary
#     firefox https://addons.mozilla.org/firefox/downloads/file/739212/verificador_ortografico_para_portugues_do_brasil-2.5-3.2.13-an+fx+sm+tb.xpi?src=dp-btn-primary
#     sleep 5
# fi

#Instalação do slackpkgplus
if [ $slackpkg == yes ] && [ $slackpkgplus == yes ]; then
    echo -e "$slackpkgplustxt"
    echo "Baixando slackpkg+"
    sleep 3
    wget -q  -nv -e robots=0 -A .txz -r -nd -cP /tmp http://www.slakfinder.org/slackpkg+/pkg/
    sleep 3
    installpkg /tmp/slackpkg+*
    rm /tmp/slackpkg+*
    sleep 3
fi

#Aplicando layer multilib
if [ $multilib == yes ] && [ $slackpkgplus == yes ] && [ $slackpkg == yes ]; then
    echo -e "$multilibtxt"
    echo
    sed -i '/PKGS_PRIORITY=( multilib )/s/^#//g' /etc/slackpkg/slackpkgplus.conf # --------- descomenta determinada linhas --------- #
    /usr/doc/slackpkg+-1.7.0/setupmultilib.sh
    sleep 3
fi

#Instalação dos programas listados no arquivo pkg.txt
if [ $pkgs == yes ]; then
    if [ ! -f "$pkgs" ]; then
	echo -e "$apkgstxt"
	wget -q  -nv -e robots=0 -r -nd -cP /tmp \
	$rawconfigs/pkgs.txt
    else
	echo -e "$RED Arquivo $GREEN $apkgstxt $RED encontrado. $NC"
	sleep 5
    fi
    echo -e "$pkgstxt"
    slackpkg install $(cat $lpkgs)
    sleep 3
fi

#Criação do arquivo de credenciais do hubiC
if [ $hubiCNET4YOU == yes ]; then
    echo -e "$credhubiCNET4YOUtxt"
    echo "" >> /home/ahlr/.hubic_credentials
    echo "" >> /home/ahlr/.hubic_credentials
    echo "#Backup da pasta /home/ahlr/Dropbox/NET4YOU/" >> /home/ahlr/.hubic_credentials
    echo "email = financeio@net4you.com.br" >> /home/ahlr/.hubic_credentials
    echo "password = xxxxxxxxx" >> /home/ahlr/.hubic_credentials
    echo "client_id = api_hubic_AX1GBGXFqcoFRaB6TcmORhneQ33DYgdp" >> /home/ahlr/.hubic_credentials
    echo "client_secret = mraqgIdiNnxdp6oPX2SrH0w0CDFsmviE822hKvba9OA5KFw9SFatkB6Gl0mQEou5" >> /home/ahlr/.hubic_credentials
    echo "redirect_uri = http://localhost/" >> /home/ahlr/.hubic_credentials
    chown 600 /home/ahlr/.hubic_credentials
    sleep 3
fi

# Mikrotik SSH backup script
if [ $sshbackup == yes ]; then
    if [ ! -f $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh ]; then
	echo -e "$sshbackuptxt"
	echo "#!"$SHELL > $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	cat $minilicense >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "#" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "LOCAL_DIR=`dirname $0`" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "HOST=`hostname`" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "BACKUP_PATH=$drop/NET4YOU/NET4YOU/SERVIDOR/Backups" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "CONF=$LOCAL_DIR/sshbackup.conf" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "LOG=$LOCAL_DIR/sshbackup.log" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "SSH_PORT=2200 >>" $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "SSH_USER=net4you" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "SSH_PASS='XXXXXXXXXX'" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "DELETE_FILE=yes"
	echo "MAIL_FROM=server@net4you.com.br" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "MAIL_TO=server@net4you.com.br" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e "\033[1mMikrotik SSH backup utility\033[0m"" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo """ >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if [ ! -f "$CONF" ] 2>/dev/null ; then" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e "\e[31m!!!ERROR\e[0m, Configuration file not found!"" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "exit 1" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if  [ ! -d "$BACKUP_PATH" ] ; then" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e "\e[31m!!!ERROR\e[0m, Backup path not found!"" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "exit 1" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "LAST_CHAR=`tail -c 1 $CONF`" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if [ "$LAST_CHAR" != "" ] ; then" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e "" >> $CONF" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "INDEX=0" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "SCP_ERROR=no" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "while read -r line" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "do" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh 
	echo "line=`echo $line | grep :`" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if [ -n "$line" ] ; then" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if [ "${line:0:1}" != "#" ] ; then" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "IP[$INDEX]=`echo $line | cut -d: -f1 | tr -d " "`" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "DESC[$INDEX]=`echo $line | cut -d: -f2 | tr -d " "`" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if  [ ! -d "${BACKUP_PATH}/${DESC[$INDEX]}" ] ; then" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "mkdir -p ${BACKUP_PATH}/${DESC[$INDEX]}" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "INDEX=$INDEX+1" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "done < $CONF" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "cmd="/export file=zaloha.rsc;"" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo $cmd > $LOG" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo "--------------------------------------------------------------------------------" >> $LOG" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "for (( a=0 ; $a-INDEX ; a=$a+1 ))" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "do" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo ${IP[$a]} -  ${DESC[$a]}" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo ${IP[$a]} -  ${DESC[$a]} >> $LOG" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "#sshpass -p $SSH_PASS ssh -o StrictHostKeyChecking=no $SSH_USER@${IP[$a]} $cmd >> $LOG" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "sshpass -p $SSH_PASS ssh -p $SSH_PORT -o StrictHostKeyChecking=no $SSH_USER@${IP[$a]} $cmd >/dev/null 2>&1" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if [[ $? != 0 ]]; then" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e " \e[31mErr\e[0m SSH failed!"" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo "!!! SSH failed!"  >> $LOG" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "SCP_ERROR=yes" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "else" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "sleep 2" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "for SCPFILE in zaloha.rsc" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "do" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "sshpass -p $SSH_PASS scp -P $SSH_PORT -o StrictHostKeyChecking=no $SSH_USER@${IP[$a]}:/${SCPFILE} ${BACKUP_PATH}/${DESC[$a]}/ >/dev/null 2>&1" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if [[ $? != 0 ]]; then" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e " \e[31mErr\e[0m Transfer ${SCPFILE} failed!"" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo "!!! Transfer ${SCPFILE} failed!"  >> $LOG" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "SCP_ERROR=yes" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "else" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e " \e[32mOK\e[0m  Transfer ${SCPFILE} complete."" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "#echo "Transfer ${SCPFILE} complete."  >> $LOG" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "mv ${BACKUP_PATH}/${DESC[$a]}/${SCPFILE} ${BACKUP_PATH}/${DESC[$a]}/${IP[$a]}-`date +%d_%m_%Y`".rsc"" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if [ "$DELETE_FILE" == "yes" ] ; then" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "cmd2="/file remove ${SCPFILE};"" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "sshpass -p $SSH_PASS ssh -p $SSH_PORT -o StrictHostKeyChecking=no $SSH_USER@${IP[$a]} $cmd2" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if [[ $? != 0 ]]; then" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e " \e[31mErr\e[0m Remove file ${SCPFILE} from Mikrotik failed!"" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo "!!! Remove file ${SCPFILE} from Mikrotik failed!"  >> $LOG" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "else" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e " \e[32mOK\e[0m  Remove file ${SCPFILE} from Mikrotik."" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "done" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo """ >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo "--------------------------------------------------------------------------------" >> $LOG" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "done" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if [ "$SCP_ERROR" == "yes" ] ; then" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e """ >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e "\e[31m Err\e[0m \033[1m When backing up the\033[0m \e[31mERROR\e[0m \033[1moccurred.\033[0m"" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e "`date "+%Y-%m-%d %T"` \t  !!!ERROR - When backing up the ERROR occurred." >> $LOG" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo """ >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e "\033[1mCheck the log file: $LOG \033[0m"" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo -e "!!!ERROR - When backing up the ERROR occurred.\nCheck the $HOST server log file: $LOG" # | mail -s "Server: $HOST - Backup Mikrotiks ended with ERRORS!" -r $MAIL_FROM $MAIL_TO" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "else" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e """ >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e " \e[32mOK\e[0m  \033[1mThe backup is complete.\033[0m"" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e "`date "+%Y-%m-%d %T"` \t  OK - The backup is complete." >> $LOG" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "sleep 5" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo """ >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "chmod 777 -R ${BACKUP_PATH}" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "# APAGAR DEPOIS DE 3 SEMANAS" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "find ${BACKUP_PATH} -mtime +15 -type f -delete" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
    else
	sleep 5
	echo -e "$RED Script $GREEN sshbackup.sh $RED encontrado. $NC"  
    fi
    chmod +x $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
    
    if [ ! -f $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf ]; then
    #
    # Configuration file sshbackup.conf
    #
	echo "# Configuration file sshbackup.conf" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "#" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "# Format:" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "# MIKROTIK_IP_ADDRESS:DESCRIPTION" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "#" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "# Example:" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "# 10.0.0.1:Main Router" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "# 10.0.2.1:Remote/Main Router" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "#" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo """" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "192.168.1.1:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.2:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.3:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.4:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.5:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.6:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.7:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.8:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.9:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.10:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.11:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.12:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.13:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.14:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.15:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.16:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.18:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.19:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.20:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.21:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.24:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.25:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.26:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.27:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.28:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.29:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.30:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.31:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.33:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.34:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.35:MK" >> $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
    else
	sleep 5
	echo -e "$RED Script $GREEN sshbackup.conf $RED encontrado. $NC"  
    fi
	sleep 3
fi

#Configura gpg-agent
if [ $gpg == yes ]; then
    echo -e "$gpgtxt"
    echo
    sed -i '/use-agent/s/^#//g' //home/ahlr/.gnupg/gpg.conf # --------- descomenta determinada linhas --------- #
    sed -i '/--gpg-agent-info=<path>:<pid>:1/s/^#//g' //home/ahlr/.gnupg/gpg.conf # --------- descomenta determinada linhas --------- #
    sleep 3
fi
# --------- Início das configurações --------- #	
	if [ $bblazenet4you == yes ]; then
	echo -e "$bblazenet4youtxt"
	echo
	echo -e "$YELLOW Abrindo $GREEN backblaze_NET4YOU $YELLOW no konsole....  $NC" 
	echo
	echo
	echo -e "$YELLOW Lembrete:....  $WHITE "deus$GREEN +$WHITE dentro$GREEN +$WHITE mim" $NC"
	sleep 5
	    
	vim $crondaily/backblaze_NET4YOU.sh
	
	echo -e "$BLUE backblaze_NET4YOU $YELLOW configurado!  $NC"

echo
echo	
echo -e "$CYAN # --------- # --------- #  $NC"
echo
echo
	fi
	
	if [ $bblazetonico == yes ]; then
	echo -e "$bblazetonicotxt"
	echo
	echo -e "$YELLOW Abrindo $GREEN backblaze_TONICO $YELLOW no konsole....  $NC"
	echo
	echo
	echo -e "$YELLOW Lembrete:....  $WHITE "deus$GREEN +$WHITE dentro$GREEN +$WHITE mim" $NC"
	sleep 5
	    
	vim $crondaily/backblaze_TONICO.sh
	
	echo -e "$BLUE backblaze_TONICO $YELLOW configurado!  $NC"
echo
echo	
echo -e "$CYAN # --------- # --------- #  $NC"
echo
echo
	fi
	
	if [ $credhubiCNET4YOU == yes ]; then
	echo -e "$credhubiCNET4YOUtxt"
	echo
	echo -e "$YELLOW Abrindo $GREEN hubic_credentials $YELLOW no konsole....  $NC"
	echo
	echo
	echo -e "$YELLOW Lembrete:....  $WHITE "país$GREEN +$WHITE 2014" $NC"
	sleep 5
	    
	vim /home/ahlr/.hubic_credentials
	
	echo -e "$BLUE hubic_credentials $YELLOW configurado!  $NC"

	
	
echo
echo	
echo -e "$CYAN # --------- # --------- #  $NC"
echo
echo
	fi
	
	if [ $sshbackup == yes ]; then
	echo -e "$sshbackuptxt"
	echo
	echo -e "$YELLOW Abrindo $GREEN sshbackup $YELLOW no konsole....  $NC"
	echo
	echo
	echo -e "$YELLOW Lembrete:....  $WHITE "Tos$GREEN +$WHITE bag" $NC"
	sleep 5
	    
	vim $drop/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	
	echo -e "$BLUE sshbackup.sh $YELLOW configurado!  $NC"
	
echo
echo	
echo -e "$CYAN # --------- # --------- #  $NC"
echo
echo
	fi
clear	
echo
echo
echo -e "$CYAN Pacotes instalados e Configurações realizadas!! $NC"
echo
echo
	  
# --------- Apagando arquivos auxiliares no diretório /tmp --------- #
 
    if [ -f "$minilicense" ]; then
	rm /tmp/minilicense.txt
    fi
	  
# --------- Início do fim --------- # 
    ;;
    
    * ) exit;; ## Add whatever other tests you need
  esac
	else
	echo -e "$CYAN Deseja rodar o script novamente? [yes/no] $NC"
	read RESPOSTA2
	test "$RESPOSTA2" = "no" && echo && echo && echo "OK Até mais!" && exit
	 sh teste.sh
      fi


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

#REFERÊNCIAS:

#sed -i '/PKGS_PRIORITY=( multilib ktown )/s/^/#/g' /etc/slackpkg/slackpkgplus.conf # --------- comenta determinada linhas --------- #
#sed -i '/PKGS_PRIORITY=( multilib )/s/^#//g' /etc/slackpkg/slackpkgplus.conf # --------- descomenta determinada linhas --------- #
#sed -i "s/^#*/#/" /etc/profile.d/lang.sh # --------- comenta todas as linhas --------- #
#
#
#
#
#
