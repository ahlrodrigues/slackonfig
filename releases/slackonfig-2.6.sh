#!/bin/bash
#
##
###
##################################################################################
# Autor: Antonio Henrique (Fela)                                                 #
# e-mail: ahlr_2000@yahoo.com                                                    #
#                                                                                #
# repositórios:                                                                  #
# github.com/ahlrodrigues/slackonfig                                             #
# bitbucket.org/ahlrodrigues/slackonfig                                          #
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
# V0.current                                                                     #
#                                                                                #
# Last update: 2018/06/19                                                        #
#                                                                                #
##################################################################################
###
##
#
#
# PARA QUE O SCRIPT FUNCIONE TROCUE A VARIÁVEL slackonfig=nof PARA slackonfig=yes. Utilizado para aplicar funções pré configuradas.
slackonfig=no

# inittab | ntp | cups | konsole | lang | wallpaper |

# Para ativar as funções deste script, troque as variábeis abaixo para "yes".
# Veja as funcões de cada script na página inicial do projeto slackonfig: 
# https://github.com/ahlrodrigues/slackonfig
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
mirrorx86_64=no
mirrorarm=no  
inittab=no
networkmanager=no
konsole=no
reccx=no
brother=no
lang=no
thunderbackup=no
thunderbird=no
bblazetonico=no
bblazenet4you=no
data=no
winbox=no
cashflow=no
skyline=no
cobranca=no
slackpkg=no
slackpkgplus=no
pkgs=no
hubiCNET4YOU=no
credhubiCNET4YOU=no
multilib=no
sshbackup=no
ktown=no
clamav=no
projetos=no
doplexpkg=no
doteamviewerpkg=no
dochangelog=no
wallpaper=no
localerc=no

# --------- Mensagens --------- #
mlocaltxt="$GREEN Configurando mirror local $NC"
aminilicensetxt="$GREEN Arquivo de licença a ser incluído nos spripts $NC"
acolorstxt="$GREEN Arquivo de cores a ser incluído nos spripts $NC"
apkgstxt="$GREEN Arquivo com lista de pacotes a serem instalados pelo slackpkg $NC"
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
mirrorx86_64txt="$GREEN Administração do mirror x86_64 locail; $NC"
mirrorarmtxt="$GREEN Administração do mirror ARM locail; $NC"
inittabtxt="$GREEN Habilitando o init 4; $NC"
networkmanagertxt="$GREEN Inicialzando networkmanager; $NC"
konsoletxt="$GREEN Configura o profile do Konsole; $NC"
reccxtxt="$GREEN Cria pasta para os arquivos da CEF e dá permissão de usuário; $NC"
brothertxt="$GREEN instalacao do driver da impressora; $NC"
langtxt="$GREEN Configurando local pt-BR; $NC"
thunderbackuptxt="$GREEN Cria/Recupera backup do Thunderbird; $NC"
thunderbirdtxt="$GREEN Cria configurações do Thunderbird; $NC"
bblazetonicotxt="$GREEN Faz backup no Backblaze; $NC"
bblazenet4youtxt="$GREEN Faz backup no Backblaze; $NC"
datatxt="$GREEN Script de calculo data; $NC"
winboxtxt="$GREEN Cria a entrada do Winbox no menu do KDE; $NC"
cashflowtxt="$GREEN Cria a entrada do CashFlow no menu do KDE; $NC"
skylinetxt="$GREEN Cria a entrada do Skyline no menu do KDE; $NC"
cobrancatxt="$GREEN Cria script de administração da cobramça do BN; $NC"
slackpkgtxt="$GREEN Instala e configura o slackpkg; $NC"
slackpkgplustxt="$GREEN Instala e configura slackpkgplus; $NC"
pkgstxt="$GREEN Instalacao da lista de pacotes; $NC"
hubiCNET4YOUtxt="$GREEN Faz backup no hubic; $NC"
credhubiCNET4YOUtxt="$GREEN Cria as credenciais da conta hubiC_NET4YOU; $NC"
multilibtxt="$GREEN Aplica layer multilib; $NC"
sshbackuptxt="$GREEN Cria script de backup dos equipamentos mikrotik; $NC"
ktowntxt="$GREEN Cria o script rsync para o ktown do AlienBob; $NC"
clamavtxt="$GREEN Inicialzando do clamav; $NC"
projetostxt="$GREEN Atualiza pasta Projetos local; $NC"
doplexpkgtxt="$GREEN Automatiza o Slackbuild do Plexmediaserver; $NC"
doteamviewerpkgtxt="$GREEN Automatiza o Slackbuild do Teamviewer; $NC"
dochangelogtxt="$GREEN Cria o script para escerever no ChangeLog.txt; $NC"
wallpapertxt="$GREEN Configura o papel de parede padrão; $NC"
localerctxt="$GREEN Configura o idioma do plasma; $NC"

# --------- Lista de dependências  --------- #
sshbackupdep="$PINK sshbackup=> sshpass; $NC"
blazehubicdep="$PINK duplicity=> librsync, lockfile, pip; $NC"



# --------- Caminhos mais usados  --------- #
crondaily=/etc/cron.daily
cronhourly=/etc/cron.hourly
minilicense=/tmp/minilicense.txt
colors=/tmp/colors.txt
lpkgs=/tmp/pkgs.txt
rcd=/etc/rc.d
ulbin=/usr/local/bin
usa=/usr/share/applications
blacklist=">> /etc/slackpkg/blacklist"
rawdocs=https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/docs
rawconfigs=https://raw.githubusercontent.com/ahlrodrigues/slackonfig/master/configs
imag="/home/ahlr/Dropbox/TONICO/Projetos/slackonfig/imgs"
dropbox=/home/ahlr/Dropbox
downloads=/home/ahlr/Downloads
permix="chmod +x"
permi0="chmod 770"
permi7="chmod 777"
caminho=/mnt/sda3/Slackware
home=/home/ahlr
null="/dev/null"

 

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

# --------- Teste se está logado como root --------- #
if [[ $(whoami) == "root" ]]; then

# --------- Teste se está conectado na internet --------- #
echo
echo
echo -e "$BRED$RED Testando conexão, aguarde... $NC"
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
    sleep 5
    clear

# --------- Baixando arquivos auxiliares no diretório /tmp --------- #

    echo
    echo
    echo -e "$RED Verificando se é necessários baixar arquivos auxiliare...: $NC"
    echo
    echo
    if [ ! -f "$minilicense" ]; then
    echo -e "$GREEN Baixando...: $NC $aminilicensetxt"
    echo
	echo
	wget -q  -nv -e robots=0 -r -nd -cP /tmp \
	$rawdocs/minilicense.txt
    else
	echo -e "$RED Arquivo $GREEN minilicense.txt $RED foi encontrado. $NC"
	sleep 5
    fi
    
    if [ ! -f "$colors" ]; then
    echo -e "$GREEN Baixando...: $NC $acolorstxt"
    echo
	echo
	wget -q  -nv -e robots=0 -r -nd -cP /tmp \
	$rawdocs/colors.txt
    else
	echo -e "$RED Arquivo $GREEN colors.txt $RED foi encontrado. $NC"
	sleep 5
    fi

clear


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
	
	if [ $ntp == yes ] || [ $slackonfig == yes ]; then
	  echo -e "$ntptxt"
	fi
	
	if [ $samba == yes ]; then
	  echo -e "$sambatxt"
	fi
    
    if [ $cups == yes ] || [ $slackonfig == yes ]; then
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

	if [ $mirrorx86_64 == yes ]; then
	  echo -e "$mirrorx86_64txt"
	fi
		
    if [ $mirrorarm == yes ]; then
	  echo -e "$mirrorarmtxt"
	fi

	if [ $inittab == yes ] || [ $slackonfig == yes ]; then
	  echo -e "$inittabtxt"
	fi
	
	if [ $networkmanager == yes ]; then
	  echo -e "$networkmanagertxt"
	fi
	
	if [ $konsole == yes ] || [ $slackonfig == yes ]; then
	  echo -e "$konsoletxt"
	fi
	
	if [ $reccx == yes ]; then
	  echo -e "$reccxtxt"
	fi
	
	if [ $brother == yes ]; then
	  echo -e "$brothertxt"
	fi
	
	if [ $lang == yes ] || [ $slackonfig == yes ]; then
	  echo -e "$langtxt"
	fi
	
	if [ $thunderbackup == yes ]; then
	  echo -e "$thunderbackuptxt"
	fi
 	
 	if [ $thunderbird == yes ]; then
 	  echo -e "$thunderbirdtxt"
 	fi
	
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
	
	if [ $cobranca == yes ]; then
	  echo -e "$cobrancatxt"
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

	if [ $multilib == yes ]; then
	  echo -e "$multilibtxt"
	fi
	
	if [ $sshbackup == yes ]; then
	  echo -e "$sshbackuptxt"
	fi
    
    if [ $ktown == yes ]; then
	  echo -e "$ktowntxt"
	fi 
	
    if [ $clamav == yes ]; then
	  echo -e "$clamavtxt"
	fi
	
    if [ $projetos == yes ]; then
	  echo -e "$projetostxt"
	fi
	
    if [ $doplexpkg == yes ]; then
	  echo -e "$doplexpkgtxt"
	fi	
	
    if [ $doteamviewerpkg == yes ]; then
	  echo -e "$doteamviewerpkgtxt"
	fi
	
    if [ $dochangelog == yes ]; then
	  echo -e "$dochangelogtxt"
	fi
	
    if [ $wallpaper == yes ] || [ $slackonfig == yes ]; then
	  echo -e "$wallpapertxt"
	fi
	
    if [ $localerc == yes ] || [ $slackonfig == yes ]; then
	  echo -e "$localerctxt"
	fi
# --------- Listando funções --------- #
	echo
	echo
	echo -e "$CYAN Deseja executar as funções acima? Posso continuar? [Y;y|N;n] $NC"

	 read RESPOSTA
	 case $RESPOSTA in
	 N|n)
	 echo
	 echo
	 echo -e "$BROWN Saindo!!! $NC"
	 echo
	 echo
	 exit
	 ;;

# --------- Texto 1 --------- #
	Y|y)
	clear
	echo
	echo
	echo -e "$BROWN Criando todos os arquivos de configuração nas devidas pastas e executando processos de configuração $NC"
	echo
	echo	
	sleep 5
      

##########################################
#                                        #      
# --------- Início das Funções --------- #      
#                                        #      
#   NÃO EDITAR A PARTIR DESTE PONTO!     #      
#                                        #      
##########################################

# --------- Configurando slackpkg mirror local --------- #
        if [ $mlocal == yes ]; then
        echo -e "$mlocaltxt"
        echo
        echo 
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
	    echo -e "$BROWN rsync -azhv $GREEN $origem $dropbox/TONICO/Thunderbird $NC"
	   	;;
	    2 )
	    echo -e "$BLUE [ 2 ] Para copiar as configuracoes do Thunderbird para o outra pasta, preciso que você escreva o caminho da pasta de destino: $NC"
	    echo
	    echo -e "$RED Não esqueça das barras $BCYAN $CYAN / $NC $RED no início e fim do daminho!!$NC"
	    echo
	    read destino
	    echo
	    echo
	    echo -e "$BROWN rsync -azhv $dropbox/TONICO/Thunderbird $BLUE $destino $NC"
		;;
	    *) 
	    echo
	    echo
	    echo -e "$BRED $RED Opção Inválida, saindo!!! $NC"
	    echo
	    echo
	    sleep 5
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
    echo "pasta_origem=$downloads" >> $crondaily/cleanret.sh
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
      fiyes
    echo "mv \$pasta_origem/*.ret \$pasta_retorno" >> $crondaily/cleanret.sh
    echo "mv \$pasta_origem/*.rem \$pasta_remessa" >> $crondaily/cleanret.sh
    $crondaily/cleanret.sh
    $permi $crondaily/cleanret.sh
    sleep 5
fi
fi

# Criar script que move os arquivos de Rejeitado e Francesinha do BNB
# para uma pasta de backup no diretório /opt/caixa/Recebidos.
if [ $mvrejsgr == yes ]; then
    echo -e "$mvrejsgrtxt"
    echo "#!"$SHELL > $crondaily/mvrejsgr.sh
    cat $minilicense >> $crondaily/mvrejsgr.sh
    echo "#" >> $crondaily/mvrejsgr.sh
    echo "# Cria variáveis" >> $crondaily/mvrejsgr.sh
    echo "pasta_origem=$downloads" >> $crondaily/mvrejsgr.sh
    echo "pasta_destino=$dropbox/NET4YOU/NET4YOU/Bancos/BNB/Arquivos" >> $crondaily/mvrejsgr.sh
    echo "#" >> $crondaily/mvrejsgr.sh
    echo "# Renomeia os arquivos" >> $crondaily/mvrejsgr.sh
    echo "mv \$pasta_origem/rel*.pdf  \$pasta_origem/Rejeitados-\`"date +\"%F\""\`.pdf 2> /dev/null" >> $crondaily/mvrejsgr.sh
    echo "mv \$pasta_origem/sgr*.pdf  \$pasta_origem/Francesinha-\`"date +\"%F\""\`.pdf 2> /dev/null" >> $crondaily/mvrejsgr.sh
    echo "#" >> $crondaily/mvrejsgr.sh
    echo "# Move os arquivos da pasta ../Downloads para a pasta ../BNB/Arquivos" >> $crondaily/mvrejsgr.sh
    echo "mv \$pasta_origem/Francesinha*.pdf \$pasta_destino 2> /dev/null" >> $crondaily/mvrejsgr.sh
    echo "mv \$pasta_origem/Rejeitados*.pdf \$pasta_destino 2> /dev/null" >> $crondaily/mvrejsgr.sh
    $permix $crondaily/mvrejsgr.sh
    $permi0 $crondaily/mvrejsgr.sh
    ln $crondaily/mvrejsgr.sh $ulbin/mvrejsgr.sh
    sleep 5
fi

# Criar script que move o recibo de entrehga do SICI
#  para a pasta de backup ../SCM/SICI.
if [ $cleansici == yes ]; then
    echo -e "$cleansicitxt"
    echo "#!"$SHELL > $crondaily//cleansici.sh
    cat $minilicense >> $crondaily/cleansici.sh
    echo "#Mover os arquivos declaração do SICI para a pasta $dropbox/NET4YOU/NET4YOU/SCM/SICI" >> $crondaily/cleansici.sh
    echo "#" >> $crondaily/cleansici.sh
    echo "# Cria variáveis" >> $crondaily/cleansici.sh
    echo "pasta_origem=$downloads" >> $crondaily/cleansici.sh
    echo "pasta_destino=$dropbox/NET4YOU/NET4YOU/SCM/SICI" >> $crondaily/cleansici.sh
    echo "#" >> $crondaily/cleansici.sh
    echo "# Move o recibo de entrehga do SICI para a pasta de backup ../SCM/SICI" >> $crondaily/cleansici.sh
    echo "mv \$pasta_origem/sici*.xml \$pasta_destino 2> /dev/null" >> $crondaily/cleansici.sh
    $permix $crondaily/cleansici.sh
    $permi0 $crondaily/cleansici.sh
    sleep 5
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
    echo "if  [ ! -d /home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/BNB/skyline/recebidos ]; then" >> $crondaily/cleansai.sh
    echo "mkdir /home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/BNB/skyline/recebidos/" >> $crondaily/cleansai.sh
    echo "else" >> $crondaily/cleansai.sh
    echo "#" >> $crondaily/cleansai.sh
    echo "#Copia os arquivos de retorno para a pasta de backup" >> $crondaily/cleansai.sh
    echo "mv \$pasta_origem/*.SAI \$pasta_destino" >> $crondaily/cleansai.sh
    echo "fi" >> $crondaily/cleansai.sh
    $permix $crondaily/cleansai.sh
    $permi0 $crondaily/cleansai.sh
    sleep 5
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
    $permix $crondaily/cleancache.sh
    $permi0 $crondaily/cleancache.sh
    sleep 5
fi

# Configura o servidor NTP Brasileiro
if [ $ntp == yes ]; then	
    echo -e "$ntptxt"
    sed -i "s/^#*/#/" /etc/ntp.conf
    sed -i "/server 3/a server pool.ntp.br iburst" /etc/ntp.conf
   	if [ -x $rcd/rc.ntpd ]; then
	  $permix $rcd/rc.ntpd
	  $rcd/rc.ntpd restart > $null
	fi
    sleep 5
fi

# Configura o servidor de compartilhamento de aquivos Samba
if [ $samba == yes ]; then
    echo -e "$sambatxt"
    sed -i "s/MYGROUP/workgroup/g" /etc/samba/smb.conf-sample
    mv /etc/samba/smb.conf-sample /etc/samba/smb.conf
    sleep 5
    echo -e "$samba2txt"
    if [ -x $rcd/rc.samba ]; then
	$permix $rcd/rc.samba
	$permi0 $rcd/rc.samba
	$rcd/rc.samba start > $null
    fi
    sleep 5
fi

# Inicia o servidor de impressão CUPS
if [ $cups == yes ]; then
    echo -e "$cupstxt"
    if [ -x $rcd/rc.cups ]; then
    $permix $rcd/rc.cups
    $rcd/rc.cups start > $null
    fi
    sleep 5
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
    $permix $rcd/rc.local_shutdown
    $permi0 $rcd/rc.local_shutdown
    sleep 5
fi

# Iniciando do deamon Teamviewer
if [ $teamviewerd == yes ]; then	
    echo -e "$teamviewerdtxt"
    echo
    echo "Testando se o Teamviewer esta instalado"
    if [ ! -f "$rcd/rc.teamviewerd" ]; then
    echo
    echo "O Teamviewer nao esta instalado!"
    echo
    if [ grep teamviewerd /etc/rc.d/rc.local > $null ]; then
    $permix $rcd/rc.teamviewerd
    $permi0 $rcd/rc.teamviewerd
    $rcd/rc.teamviewerd start > $null
    else
    echo "#Inicializando o deamon rc.teamviewerd" >> $rcd/rc.local
    echo "if [ -x $rcd/rc.teamviewerd ]; then" >> $rcd/rc.local
    echo "$rcd/rc.teamviewerd start" >> $rcd/rc.local
    echo "fi" >> $rcd/rc.local
    $permix $rcd/rc.teamviewerd
    $permi0 $rcd/rc.teamviewerd
    $rcd/rc.teamviewerd start > $null
    sleep 5
    fi

    fi

fi

#Iniciando do deamon Plex
if [ $plex == yes ]; then
    echo -e "$plextxt"
    echo
    echo "Testando se o Plex esta instalado"
    if [ ! -f "$rcd/rc.plexmediaserver" ]; then
    echo
    echo "O Plex nao esta instalado!"
    echo
    if [ grep plexmediaserver /etc/rc.d/rc.local > $null ]; then
    $permix $rcd/rc.plexmediaserver
    $permi0 $rcd/rc.plexmediaserver
    $rcd/rc.plexmediaserver start > $null
    else 
    echo "#Inicializando o deamon rc.plexmediaserver" >> $rcd/rc.local
    echo "if [ -x $rcd/rc.plexmediaserver ]; then" >> $rcd/rc.local
    echo "$rcd/rc.plexmediaserver start" >> $rcd/rc.local
    echo "fi" >> $rcd/rc.local
    $permix $rcd/rc.plexmediaserver
    $permi0 $rcd/rc.plexmediaserver
    $rcd/rc.plexmediaserver start > $null
    fi
    sleep 5
fi
fi


# Baixa o script do AlienBob e configura para mirrors locais x86_64 
if [ $mirrorx86_64 == yes ]; then
    echo -e "$mirrorx86_64txt"
    wget -q  -nv -e robots=0 -r -nd -cP $crondaily http://www.slackware.com/~alien/tools/mirror-slackware-current.sh
    sed -i "s|BUILDER:-\"Eric Hameleers <alien@slackware.com>\"|BUILDER:-\"Fela  <ahlr_2000@yahoo.com>\"|g" $crondaily/mirror-slackware-current.sh
    sed -i "s|/home/ftp/pub/Linux/Slackware|$caminho|g" $crondaily/mirror-slackware-current.sh
    sed -i "s|VERBOSE:-\"-q\"|VERBOSE:-\"-v --progress\"|g" $crondaily/mirror-slackware-current.sh
    sed -i "s|ISO:-\"CDROM\"}|ISO:-\"DVD\"}|g" $crondaily/mirror-slackware-current.sh
    sed -i "s|EXCLUDES:-\"--exclude pasture\"|EXCLUDES:-\"--exclude pasture --exclude source\"|g" $crondaily/mirror-slackware-current.sh
    sed -i "s|DVD_EXCLUDES:-\"-x ./testing  -x ./source -x ./extra/source\"|DVD_EXCLUDES:-\"-x ./source -x ./extra/source\"|g" $crondaily/mirror-slackware-current.sh
    sed -i "s|ARCH:-\"x86\"|ARCH:-\"x86_64\"|g" $crondaily/mirror-slackware-current.sh
    mv $crondaily/mirror-slackware-current.sh $crondaily/mirror-slackware64-current.sh
    if [ -f $ulbin/mirror-slackware64-current.sh ]; then
    rm $ulbin/mirror-slackware64*
    $permix $crondaily/mirror-slackware64*
    $permi0 $crondaily/mirror-slackware64*
    ln $crondaily/mirror-slackware64-current.sh $ulbin/mirror-slackware64-current.sh
    fi
    sleep 5
fi

# Baixa o script do AlienBob e configura para mirrors locais ARM
if [ $mirrorarm == yes ]; then
    echo -e "$mirrorarmtxt"
    wget -q  -nv -e robots=0 -r -nd -cP $crondaily http://www.slackware.com/~alien/tools/mirror-slackware-current.sh
    sed -i "s|BUILDER:-\"Eric Hameleers <alien@slackware.com>\"|BUILDER:-\"Fela  <ahlr_2000@yahoo.com>\"|g" $crondaily/mirror-slackware-current.sh
    sed -i "s|/home/ftp/pub/Linux/Slackware|$caminho|g" $crondaily/mirror-slackware-current.sh
    sed -i "s|VERBOSE:-\"-q\"|VERBOSE:-\"-v --progress\"|g" $crondaily/mirror-slackware-current.sh
    sed -i "s|ISO:-\"CDROM\"}|ISO:-\"NONE\"}|g" $crondaily/mirror-slackware-current.sh
    sed -i "s|EXCLUDES:-\"--exclude pasture\"|EXCLUDES:-\"--exclude pasture --exclude source\"|g" $crondaily/mirror-slackware-current.sh
    sed -i "s|DVD_EXCLUDES:-\"-x ./testing  -x ./source -x ./extra/source\"|DVD_EXCLUDES:-\"-x ./source -x ./extra/source\"|g" $crondaily/mirror-slackware-current.sh
    sed -i "s|ARCH:-\"x86\"|ARCH:-\"arm\"|g" $crondaily/mirror-slackware-current.sh
    sed -i "s|RSYNCURLROOT:-\"rsync.osuosl.org::slackware/\"|RSYNCURLROOT:-\"rsync.slackware.pl::slackwarearm/\"|g" $crondaily/mirror-slackware-current.sh
    mv $crondaily/mirror-slackware-current.sh $crondaily/mirror-slackwarearm-current.sh
    if [ -f $ulbin/mirror-slackwarearm-current.sh ]; then
    rm $ulbin/mirror-slackwarearm*
    fi
    $permix $crondaily/mirror-slackwarearm*
    $permi0 $crondaily/mirror-slackwarearm*
    ln $crondaily/mirror-slackwarearm-current.sh $ulbin/mirror-slackwarearm-current.sh
    sleep 5
fi

# Configura a inicialização do sistema em init 4
if [ $inittab == yes ] || [ $slackonfig == on ]; then
    echo -e "$inittabtxt"
    sed -i "s/id:3/id:4/g" /etc/inittab
    sleep 5
fi

# Iniciando do deamon networkmanager  
if [ $networkmanager == yes ]; then
    echo -e "$networkmanagertxt"
    echo "#Inicializando o deamon rc.networkmanager" >> $rcd/rc.local
    echo "if [ -x $rcd/rc.networkmanager ]; then" >> $rcd/rc.local
    echo "$rcd/rc.networkmanager start" >> $rcd/rc.local
    echo "fi" >> $rcd/rc.local
    echo "#" >> $rcd/rc.local
    $permix $rcd/rc.networkmanager
    $permi0 $rcd/rc.networkmanager
    sleep 5
fi

# Configura o profile do Konsole
if [ $konsole == yes ]; then
    echo -e "$konsoletxt"
    echo "[General]" > /home/ahlr/.local/share/konsole//Shell.profile
    echo "Command=/bin/bash -l" >> /home/ahlr/.local/share/konsole/Shell.profile
    echo "Name=Shell" >> /home/ahlr/.local/share/konsole/Shell.profile
    echo "Parent=FALLBACK/" >> /home/ahlr/.local/share/konsole/Shell.profile
    sleep 5
fi

if [ $reccx == yes ]; then
    echo -e "$reccxtxt"
    mkdir -p /opt/caixa/Recebidos
    chmod -R 777 /opt/caixa
    sleep 5
fi

# Instalação do driver da impressora
if [ $brother == yes ]; then
    echo -e "$brothertxt"
    wget -cP /tmp http://download.brother.com/welcome/dlf006893/linux-brprinter-installer-2.2.0-1.gz
    gunzip /tmp/linux-brprinter-installer*
    sleep 5
fi

# Configura o idioma pt_BR no sistema 
if [ $lang == yes ]; then
    echo -e "$langtxt"
    sed -i "s/^#*/#/" /etc/profile.d/lang.sh
    echo "#Local Português Brasileiro" >> /etc/profile.d/lang.sh
    echo "export LINGUAS=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
    echo "export LANGUAGE=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
    echo "export LANG=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
    echo "export LC_ALL=pt_BR.UTF-8" >> /etc/profile.d/lang.sh
    echo "export LESSCHARSET=latin1" >> /etc/profile.d/lang.sh
    sed -i "s/^/#/g" /etc/profile.d/lang.csh
    cat /etc/profile.d/lang.sh | grep ^export | sed -e "s/export/setenv/g" -e "s/\=/\ /g" >> /etc/profile.d/lang.csh
    sleep 5
fi

#Criação do arquivo thunderbirdbackup.sh
if [ $thunderbackup == yes ]; then
    if [ $copiathunderbird -eq 1 ]; then
    echo "#!"$SHELL > $crondaily/thunderbirdbackup.sh
    cat $minilicense >> $crondaily/thunderbirdbackup.sh
    echo "#Faz cópia incremental do diretório de configurações do Thunderbird." >> $crondaily/thunderbirdbackup.sh
    echo "rsync -azhv $origem $dropbox/TONICO/Thunderbird" >> $crondaily/thunderbirdbackup.sh
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
    echo "rsync -azhv $dropbox/TONICO/Thunderbird $destino" >> $crondaily/thunderbirdbackup.sh
    echo
    echo
    echo -e "$GREEN Configuração realizada! $NC"
    echo
    echo
    $permix $crondaily/thunderbirdbackup.sh
    $permi0 $crondaily/thunderbirdbackup.sh
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
    echo "   find $dropbox/TONICO/ -type f -exec chmod 644 {} \;" >> $crondaily/backblaze_TONICO.sh
    echo "   find $dropbox/TONICO/ -type d -exec chmod 770 {} \;" >> $crondaily/backblaze_TONICO.sh
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
    $permix $crondaily/backblaze_TONICO.sh
    $permi0 $crondaily/backblaze_TONICO.sh
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
    echo "   find $dropbox/NET4YOU/ -type f -exec chmod 644 {} \;" >> $crondaily/backblaze_NET4YOU.sh
    echo "   find $dropbox/NET4YOU/ -type d -exec chmod 770 {} \;" >> $crondaily/backblaze_NET4YOU.sh
    echo "" >> $crondaily/backblaze_NET4YOU.sh
    echo "   #B2 configuration variables" >> $crondaily/backblaze_NET4YOU.sh
    echo "   B2_ACCOUNT="d258ec9a83fb"" >> $crondaily/backblaze_NET4YOU.sh
    echo "   B2_KEY="001c5d99a010da54e85dee2bea586639a95da7b7f1"" >> $crondaily/backblaze_NET4YOU.sh
    echo "   B2_BUCKET="NET4YOU"" >> $crondaily/backblaze_NET4YOU.sh
    echo "   B2_DIR=""" >> $crondaily/backblaze_NET4YOU.sh
    echo "" >> $crondaily/backblaze_NET4YOU.sh
    echo "   # Local directory to backup" >> $crondaily/backblaze_NET4YOU.sh
    echo "   LOCAL_DIR="$dropbox/NET4YOU/"" >> $crondaily/backblaze_NET4YOU.sh
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
    $permix $crondaily/backblaze_NET4YOU.sh
    $permi0 $crondaily/backblaze_NET4YOU.sh
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
    $permix $ulbin/data.sh
    sleep 5
fi  

#Criação do arquivo winbox.desktop
if [ $winbox == yes ]; then
    echo -e "$winboxtxt"
    echo "[Desktop Entry]" > $usa/winbox.desktop
    echo "Exec=wine $dropbox/NET4YOU/NET4YOU/Packages/winbox.exe" >> $usa/winbox.desktop
    echo "GenericName=Winbox" >> $usa/winbox.desktop
    echo "Icon=$imag/winbox.png" >> $usa/winbox.desktop
    echo "Name=Permite acesso ao Servidor" >> $usa/winbox.desktop
    echo "Categories=Network;" >> $usa/winbox.desktop
    echo "NoDisplay=false" >> $usa/winbox.desktop
    echo "StartupNotify=true" >> $usa/winbox.desktop
    echo "Terminal=0" >> $usa/winbox.desktop
    echo "X-KDE-SubstituteUID=false" >> $usa/winbox.desktop
    update-desktop-database -q
    sleep 5
fi

#Criação do arquivo cashflow.desktop
if [ $cashflow == yes ]; then
    echo -e "$cashflowtxt"
    echo "[Desktop Entry]" > $usa/cashflow.desktop
    echo "Exec=libreoffice $dropbox/NET4YOU/NET4YOU/Finanças/CASHFLOW.ods" >> $usa/cashflow.desktop
    echo "GenericName=CashFlow" >> $usa/cashflow.desktop
    echo "Icon=$imag/cashflow.jpg" >> $usa/cashflow.desktop
    echo "Name=Planilha CashFlow" >> $usa/cashflow.desktop
    echo "Categories=Office;" >> $usa/cashflow.desktop
    echo "NoDisplay=false" >> $usa/cashflow.desktop
    echo "StartupNotify=true" >> $usa/cashflow.desktop
    echo "Terminal=0" >> $usa/cashflow.desktop
    echo "X-KDE-SubstituteUID=false" >> $usa/cashflow.desktop
    update-desktop-database -q
    sleep 5
fi

#Criação do arquivo bnb.desktop
if [ $skyline == yes ]; then
    echo -e "$skylinetxt"
    echo "[Desktop Entry]" > $usa/bnb.desktop
    echo "Exec=$ulbin/cobrancabnb.sh" >> $usa/bnb.desktop
    echo "GenericName=BNB" >> $usa/bnb.desktop
    echo "Icon=$img/skyline.png" >> $usa/bnb.desktop
    echo "Name=Comunicação da cobrança BNB" >> $usa/bnb.desktop
    echo "Categories=Network;" >> $usa/bnb.desktop
    echo "NoDisplay=false" >> $usa/bnb.desktop
    echo "StartupNotify=true" >> $usa/bnb.desktop
    echo "Terminal=1" >> $usa/bnb.desktop
    echo "X-KDE-SubstituteUID=false" >> $usa/bnb.desktop
    update-desktop-database -q
    sleep 5
fi

#Cria script que administra cobrança BNB
if [ cobranca == yes ] && [ skyline == yes ]; then 
    echo -e "$cobrancatxt"
    echo "#!"$SHELL > $ulbin/cobrancabnb.sh
    cat $minilicense >> $ulbin/cobrancabnb.sh
    echo "arquivos=`ls $downloads/ | awk '/CB/ { print $0 }'` # REMESSAS" >> $ulbin/cobrancabnb.sh
    echo "pasta_origem=$downloads" >> $ulbin/cobrancabnb.sh
    echo "pasta_destino=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/BNB/skyline/outbox/" >> $ulbin/cobrancabnb.sh
    echo "if [ "$arquivos" != "" ]; then #Se existe arquivo de remessa" >> $ulbin/cobrancabnb.sh
    echo "mv $pasta_origem/$arquivos $pasta_destino" >> $ulbin/cobrancabnb.sh
    echo "wine /home/ahlr/.wine/drive_c/SKYLINE/skyline.exe /se=bnb123 2> /dev/null"  >> $ulbin/cobrancabnb.sh
    echo "else" >> $ulbin/cobrancabnb.sh
    echo "wine /home/ahlr/.wine/drive_c/SKYLINE/skyline.exe /se=bnb123 2> /dev/null" >> $ulbin/cobrancabnb.sh
    echo "exit 1" >> $ulbin/cobrancabnb.sh
    echo "fi" >> $ulbin/cobrancabnb.sh
fi

#Instalação do slackpkgplus
if [ $slackpkg == yes ] && [ $slackpkgplus == yes ]; then
    echo -e "$slackpkgplustxt"
    echo "Baixando slackpkg+"
    sleep 5
    wget -q  -nv -e robots=0 -A .txz -r -nd -cP /tmp http://www.slakfinder.org/slackpkg+/pkg/
    sleep 5
    installpkg /tmp/slackpkg+*
    rm /tmp/slackpkg+*
    sleep 5
fi

#Aplicando layer multilib
if [ $multilib == yes ] && [ $slackpkgplus == yes ] && [ $slackpkg == yes ]; then
    echo -e "$multilibtxt"
    echo
    sed -i '/PKGS_PRIORITY=( multilib )/s/^#//g' /etc/slackpkg/slackpkgplus.conf # --------- descomenta determinada linhas --------- #
    /usr/doc/slackpkg+-1.7.0/setupmultilib.sh
    sleep 5
fi

#Instalação dos programas listados no arquivo pkg.txt
if [ $pkgs == yes ]; then
    if [ ! -f "$pkgs" ]; then
	echo -e "$apkgstxt"
	wget -q  -nv -e robots=0 -r -nd -cP /tmp $rawdocs/pkgs.txt
    else
	echo -e "$RED Arquivo $GREEN $apkgstxt $RED foi encontrado. $NC"
	sleep 5
    fi
    echo -e "$pkgstxt"
    slackpkg install $(cat $lpkgs)
    sleep 5
fi

#Criação do arquivo de credenciais do hubiC
if [ $credhubiCNET4YOU == yes ]; then
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
    sleep 5
fi

# Mikrotik SSH backup script
if [ $sshbackup == yes ]; then
    if [ ! -f $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh ]; then
	echo -e "$sshbackuptxt"
	echo "#!"$SHELL > $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	cat $minilicense >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "#" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "LOCAL_DIR=`dirname $0`" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "HOST=`hostname`" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "BACKUP_PATH=$dropbox/NET4YOU/NET4YOU/SERVIDOR/Backups" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "CONF=$LOCAL_DIR/sshbackup.conf" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "LOG=$LOCAL_DIR/sshbackup.log" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "SSH_PORT=2200 >>" $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "SSH_USER=net4you" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "SSH_PASS='XXXXXXXXXX'" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "DELETE_FILE=yes"
	echo "MAIL_FROM=server@net4you.com.br" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "MAIL_TO=server@net4you.com.br" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e "\033[1mMikrotik SSH backup utility\033[0m"" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo """ >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if [ ! -f "$CONF" ] 2>/dev/null ; then" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e "\e[31m!!!ERROR\e[0m, Configuration file not found!"" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "exit 1" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if  [ ! -d "$BACKUP_PATH" ] ; then" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e "\e[31m!!!ERROR\e[0m, Backup path not found!"" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "exit 1" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "LAST_CHAR=`tail -c 1 $CONF`" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if [ "$LAST_CHAR" != "" ] ; then" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e "" >> $CONF" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "INDEX=0" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "SCP_ERROR=no" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "while read -r line" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "do" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh 
	echo "line=`echo $line | grep :`" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if [ -n "$line" ] ; then" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if [ "${line:0:1}" != "#" ] ; then" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "IP[$INDEX]=`echo $line | cut -d: -f1 | tr -d " "`" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "DESC[$INDEX]=`echo $line | cut -d: -f2 | tr -d " "`" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if  [ ! -d "${BACKUP_PATH}/${DESC[$INDEX]}" ] ; then" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "mkdir -p ${BACKUP_PATH}/${DESC[$INDEX]}" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "INDEX=$INDEX+1" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "done < $CONF" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "cmd="/export file=zaloha.rsc;"" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo $cmd > $LOG" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo "--------------------------------------------------------------------------------" >> $LOG" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "for (( a=0 ; $a-INDEX ; a=$a+1 ))" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "do" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo ${IP[$a]} -  ${DESC[$a]}" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo ${IP[$a]} -  ${DESC[$a]} >> $LOG" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "#sshpass -p $SSH_PASS ssh -o StrictHostKeyChecking=no $SSH_USER@${IP[$a]} $cmd >> $LOG" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "sshpass -p $SSH_PASS ssh -p $SSH_PORT -o StrictHostKeyChecking=no $SSH_USER@${IP[$a]} $cmd >/dev/null 2>&1" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if [[ $? != 0 ]]; then" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e " \e[31mErr\e[0m SSH failed!"" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo "!!! SSH failed!"  >> $LOG" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "SCP_ERROR=yes" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "else" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "sleep 2" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "for SCPFILE in zaloha.rsc" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "do" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "sshpass -p $SSH_PASS scp -P $SSH_PORT -o StrictHostKeyChecking=no $SSH_USER@${IP[$a]}:/${SCPFILE} ${BACKUP_PATH}/${DESC[$a]}/ >/dev/null 2>&1" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if [[ $? != 0 ]]; then" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e " \e[31mErr\e[0m Transfer ${SCPFILE} failed!"" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo "!!! Transfer ${SCPFILE} failed!"  >> $LOG" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "SCP_ERROR=yes" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "else" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e " \e[32mOK\e[0m  Transfer ${SCPFILE} complete."" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "#echo "Transfer ${SCPFILE} complete."  >> $LOG" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "mv ${BACKUP_PATH}/${DESC[$a]}/${SCPFILE} ${BACKUP_PATH}/${DESC[$a]}/${IP[$a]}-`date +%d_%m_%Y`".rsc"" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if [ "$DELETE_FILE" == "yes" ] ; then" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "cmd2="/file remove ${SCPFILE};"" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "sshpass -p $SSH_PASS ssh -p $SSH_PORT -o StrictHostKeyChecking=no $SSH_USER@${IP[$a]} $cmd2" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if [[ $? != 0 ]]; then" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e " \e[31mErr\e[0m Remove file ${SCPFILE} from Mikrotik failed!"" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo "!!! Remove file ${SCPFILE} from Mikrotik failed!"  >> $LOG" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "else" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e " \e[32mOK\e[0m  Remove file ${SCPFILE} from Mikrotik."" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "done" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo """ >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo "--------------------------------------------------------------------------------" >> $LOG" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "done" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "if [ "$SCP_ERROR" == "yes" ] ; then" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e """ >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e "\e[31m Err\e[0m \033[1m When backing up the\033[0m \e[31mERROR\e[0m \033[1moccurred.\033[0m"" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e "`date "+%Y-%m-%d %T"` \t  !!!ERROR - When backing up the ERROR occurred." >> $LOG" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo """ >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e "\033[1mCheck the log file: $LOG \033[0m"" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo -e "!!!ERROR - When backing up the ERROR occurred.\nCheck the $HOST server log file: $LOG" # | mail -s "Server: $HOST - Backup Mikrotiks ended with ERRORS!" -r $MAIL_FROM $MAIL_TO" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "else" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e """ >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e " \e[32mOK\e[0m  \033[1mThe backup is complete.\033[0m"" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo -e "`date "+%Y-%m-%d %T"` \t  OK - The backup is complete." >> $LOG" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "fi" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "sleep 5" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "echo """ >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "chmod 777 -R ${BACKUP_PATH}" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "# APAGAR DEPOIS DE 3 SEMANAS" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	echo "find ${BACKUP_PATH} -mtime +15 -type f -delete" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
    else
	sleep 5
	echo -e "$RED Script $GREEN sshbackup.sh $RED encontrado. $NC"  
    fi
    $permix $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
    
    if [ ! -f $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf ]; then
    #
    # Configuration file sshbackup.conf
    #
	echo "# Configuration file sshbackup.conf" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "#" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "# Format:" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "# MIKROTIK_IP_ADDRESS:DESCRIPTION" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "#" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "# Example:" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "# 10.0.0.1:Main Router" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "# 10.0.2.1:Remote/Main Router" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "#" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo """" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "192.168.1.1:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.2:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.3:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.4:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.5:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.6:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.7:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.8:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.9:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.10:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.11:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.12:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.13:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.14:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.15:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.16:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.18:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.19:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.20:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.21:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.24:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.25:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.26:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.27:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.28:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.29:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.30:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.31:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.33:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.34:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
	echo "10.10.10.35:MK" >> $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.conf
    else
	sleep 5
	echo -e "$RED Script $GREEN sshbackup.conf $RED encontrado. $NC"  
    fi
	sleep 5
fi

# Cria o script de rsync do ktown do AlienBob
if [ $ktown == yes ]; then
    echo -e "$mirrorstxt"
    echo "#!"$SHELL > $crondaily/mirror-ktown.sh
    cat $minilicense >> $crondaily/mirror-ktown.sh
    echo "rsync -HavP --exclude=x86 rsync://slackware.nl/mirrors/alien-kde/current/5/ /mnt/sda3/Slackware/Ktown/" > $crondaily/mirror-ktown.sh
    $permix $crondaily/mirror-ktown.sh
    ln $crondaily/mirror-ktown.sh $ulbin/mirror-ktown.sh
    sleep 5
fi

#Iniciando o Clamav
if [ $clamav == yes ]; then
    echo -e "$clamavtxt"
    echo "#Inicializando o deamon do Clamav" >> $rcd/rc.local
    echo "if [ -x $rcd/rc.clamav ]; then" >> $rcd/rc.local
    echo "$rcd/rc.clamav start" >> $rcd/rc.local
    echo "fi" >> $rcd/rc.local
    $permix $rcd/rc.clamav
    groupadd -g 210 clamav
    useradd -u 210 -d /dev/null -s /bin/false -g clamav clamav
    freshclam
    $rcd/rc.clamav start > $null
    sleep 5
fi

#Sync pastas Projetos do dropbox/local
if [ $projetos == yes ]; then
    echo -e "$projetostxt"
    echo "#!"$SHELL > $crondaily/projetos.sh
    cat $minilicense >> $crondaily/projetos.sh
    echo "#Sync pastas Projetos do dropbox/local" >> $crondaily/projetos.sh
    echo "pasta_origem=/home/ahlr/Dropbox/TONICO/Projetos/" >> $crondaily/projetos.sh
    echo "pasta_destino=/mnt/sda3/Projetos/" >> $crondaily/projetos.sh
    echo "#" >> $crondaily/projetos.sh
    echo "rsync -HavP \$pasta_origem \$pasta_destino" >> $crondaily/projetos.sh
    $permix $crondaily/projetos.sh
    sleep 5
fi

# Automatiza o SlackBuild Plexmediaserver
if [ $doplexpkg == yes ]; then
    echo -e "$doplexpkgtxt"
    clear
    nomep=plexmediaserver
    formatop=deb
    cd $Downloads
    if [ -e $nomep*.tar.gz ] && [ -e $nomep*.$formatop ]; then
    tar zvxf $nomep*.tar.gz
    mv $nomep*.$formatop $nomep
    else
    echo
    echo
    echo -e "$PINK Algo deu errado, o SlackBuild ou o Fonte não foi encontrado! $NC"
    echo 
    echo
    echo
    echo exit
    fi
    echo
    echo
    echo
    versao=`ls $nomep/$nomep*.$formatop | awk -F '_' {'print \$2'}`
    sed -i "s/VERSION:-.*/VERSION:-$versao}/g" $nomep/$nomep.SlackBuild
    cd $nomep
    ./$nomep.SlackBuild
    echo
    echo
    echo
    echo -e "$GREEN Vamos instalar o programa $BBROWN $nomep? Y|N $NC"
    read install
    case $install in
    Y|y)
    upgradepkg --install-new /tmp/$nomep*
    ;;
    N|n)
    exit
    echo -e "$GREEN Pacote disponível noa pasta /tmp $NC"
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
    rm -fr $download/$nomep
fi

# Automatiza o SlackBuild Teamviewer
if [ $doteamviewerpkg == yes ]; then
    echo -e "$doteamviewerpkgtxt"
    clear
    nomet=teamviewer
    formatot=amd64.deb
    cd $downloads
    if [ -e $nomet*.tar.gz ] && [ -e $nomet_*_$formatot ]; then
    tar zvxf $nomet*.tar.gz
    mv $nomet_*$formatot $nomet
    else
    echo 
    echo
    echo -e "$PINK Algo deu errado, o SlackBuild ou o Fonte não foi encontrado! $NC"
    echo 
    echo
    echo
    echo 
    exit
    fi
    echo
    echo
    echo
    versao=`ls $nomet/$nomet_*$formatot | awk -F '_' {'print \$2'}`
    sed -i "s/VERSION:-.*/VERSION:-$versao}/g" $nomet/$nomet.SlackBuild
    cd $nomet
    ./$nome.SlackBuild
    echo
    echo
    echo
    echo -e "$GREEN Vamos instalar o programa $BBROWN $nomet? Y|N $NC"
    read install
    case $install in
    Y|y)
    upgradepkg --install-new /tmp/$nomet*
    ;;
    N|n)
    exit
    echo -e "$GREEN Pacote disponível noa pasta /tmp $NC"
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
    rm -fr $download/$nomet
fi

# administra o ChangeLog dos projetos
if [ $dochangelog == yes ]; then
    echo -e "$dochangelogtxt"
    echo "#!"$SHELL > $ulbin/dochangelog.sh
    cat $minilicense >> $ulbin/dochangelog.sh
    cat $colors >> $ulbin/dochangelog.sh
    echo "" >> $ulbin/dochangelog.sh
    echo "dropbox=/home/ahlr/Dropbox" >> $ulbin/dochangelog.sh
    echo "data=\$(date +\"%c\")" >> $ulbin/dochangelog.sh
    echo "clear" >> $ulbin/dochangelog.sh    
    echo "" >> $ulbin/dochangelog.sh    
    echo "echo" >> $ulbin/dochangelog.sh    
    echo "echo" >> $ulbin/dochangelog.sh    
    echo "echo" >> $ulbin/dochangelog.sh    
    echo "echo -e "\$GREEN Inseria as alterações para o arquivo ChangeLog.txt?"" >> $ulbin/dochangelog.sh    
    echo "echo" >> $ulbin/dochangelog.sh    
    echo "echo" >> $ulbin/dochangelog.sh    
    echo "echo" >> $ulbin/dochangelog.sh    
    echo "read -r updates" >> $ulbin/dochangelog.sh    
    echo "" >> $ulbin/dochangelog.sh       
    echo "echo" >> $ulbin/dochangelog.sh     
    echo "echo" >> $ulbin/dochangelog.sh    
    echo "echo" >> $ulbin/dochangelog.sh       
    echo "echo \"*----------------------- \$data -----------------------*\"" >> $ulbin/dochangelog.sh    
    echo "echo" >> $ulbin/dochangelog.sh    
    echo "echo -e \$updates" >> $ulbin/dochangelog.sh       
    echo "" >> $ulbin/dochangelog.sh    
    echo "echo" >> $ulbin/dochangelog.sh    
    echo "echo" >> $ulbin/dochangelog.sh    
    echo "echo" >> $ulbin/dochangelog.sh    
    echo "echo -e \"\$GREEN Deseja Gravar Y|y;N|n?\$NC\"" >> $ulbin/dochangelog.sh    
    echo "echo" >> $ulbin/dochangelog.sh    
    echo "echo" >> $ulbin/dochangelog.sh    
    echo "echo" >> $ulbin/dochangelog.sh    
    echo "" >> $ulbin/dochangelog.sh    
    echo "read write" >> $ulbin/dochangelog.sh    
    echo "" >> $ulbin/dochangelog.sh    
    echo "case \$write in" >> $ulbin/dochangelog.sh     
    echo "" >> $ulbin/dochangelog.sh          
    echo "Y|y)" >> $ulbin/dochangelog.sh    
    echo "sed -i \"1s/^/\$updates\\n/\" $dropboxbox/TONICO/Projetos/slackonfig/ChangeLog.txt" >> $ulbin/dochangelog.sh    
    echo "sed -i \"1s/^/\\n/\" $dropboxbox/TONICO/Projetos/slackonfig/ChangeLog.txt" >> $ulbin/dochangelog.sh       
    echo "sed -i \"1s/^/*----------------------- \$data -----------------------*\\n/\" /home/ahlr/Dropbox/TONICO/Projetos/slackonfig/ChangeLog.txt" >> $ulbin/dochangelog.sh    
    echo "echo" >> $ulbin/dochangelog.sh    
    echo "echo" >> $ulbin/dochangelog.sh    
    echo "echo" >> $ulbin/dochangelog.sh    
    echo "echo -e \"\$GREEN Gravado!\$NC\"" >> $ulbin/dochangelog.sh   
    echo "echo" >> $ulbin/dochangelog.sh
    echo "echo" >> $ulbin/dochangelog.sh
    echo "echo" >> $ulbin/dochangelog.sh
    echo ";;" >> $ulbin/dochangelog.sh    
    echo "" >> $ulbin/dochangelog.sh            
    echo "N|n)" >> $ulbin/dochangelog.sh    
    echo "echo -e \"\$GREEN Saindo....\$NC\"" >> $ulbin/dochangelog.sh    
    echo "exit" >> $ulbin/dochangelog.sh    
    echo ";;" >> $ulbin/dochangelog.sh    
    echo "" >> $ulbin/dochangelog.sh        
    echo "*)" >> $ulbin/dochangelog.sh  
    echo "echo -e \"\$BRED Opção errada!\$NC\"" >> $ulbin/dochangelog.sh    
    echo ";;" >> $ulbin/dochangelog.sh    
    echo "" >> $ulbin/dochangelog.sh    
    echo "esac" >> $ulbin/dochangelog.sh 
    $permi7 $ulbin/dochangelog.sh
    $permix $ulbin/dochangelog.sh
fi

# Configura o Wallpapers
if [ $wallpaper == yes ]; then
    echo -e "$wallpapertxt"
    echo "[Wallpapers]" > /home/ahlr/.config/plasmarc
    echo "usersWallpapers=/home/ahlr/Dropbox/TONICO/speciale2.jpg" >> /home/ahlr/.config/plasmarc
    sleep 5
fi

# Configura o idioma
if [ $localerc == yes ]; then
    echo -e "$localerctxt"
    echo "[Formats]" > /home/ahlr/.config/plasma-localerc
    echo "LANG=pt_BR.UTF-8" >> /home/ahlr/.config/plasma-localerc
    echo "" >> /home/ahlr/.config/plasma-localerc
    echo "[Translations]" >> /home/ahlr/.config/plasma-localerc
    echo "LANGUAGE=pt_BR" >> /home/ahlr/.config/plasma-localerc
    sleep 5
fi
##########################################
#                                        #      
# ------ Início das Configurações ------ #            
#                                        #      
##########################################

  
    if [ $brother == yes ]; then
    cd /tmp
    if [ -e linux-brprinter-installer* ]; then
    $permix linux-brprinter-installer*
    ./linux-brprinter-installer*
    rm /tmp/linux-brprinter-installer*
    rm /tmp/uninstaller_*
    rm /tmp/brscan*
    rm /tmp/cupswr*
    rm /tmp/dcp7065*
    else
    echo -e "O driver da impressora não foi baixado"
    fi
    
clear
echo
echo	
echo -e "$CYAN # --------- # --------- #  $NC"
echo
echo
fi

	if [ $bblazenet4you == yes ]; then
	echo -e "$bblazenet4youtxt"
	echo
	echo -e "$BROWN Abrindo $GREEN backblaze_NET4YOU $BROWN no konsole....  $NC" 
	echo
	echo
	echo -e "$BROWN Lembrete:....  $WHITE "deus$GREEN +$WHITE dentro$GREEN +$WHITE mim" $NC"
	sleep 5
	    
	vim $crondaily/backblaze_NET4YOU.sh
	
	echo -e "$BLUE backblaze_NET4YOU $BROWN configurado!  $NC"
	
echo
echo	
echo -e "$CYAN # --------- # --------- #  $NC"
echo
echo
    fi
	
	if [ $bblazetonico == yes ]; then
	echo -e "$bblazetonicotxt"
	echo
	echo -e "$BROWN Abrindo $GREEN backblaze_TONICO $BROWN no konsole....  $NC"
	echo
	echo
	echo -e "$BROWN Lembrete:....  $WHITE "deus$GREEN +$WHITE dentro$GREEN +$WHITE mim" $NC"
	sleep 5
	    
	vim $crondaily/backblaze_TONICO.sh
	
	echo -e "$BLUE backblaze_TONICO $BROWN configurado!  $NC"
echo
echo	
echo -e "$CYAN # --------- # --------- #  $NC"
echo
echo
	fi
	
	if [ $credhubiCNET4YOU == yes ]; then
	echo -e "$credhubiCNET4YOUtxt"
	echo
	echo -e "$BROWN Abrindo $GREEN hubic_credentials $BROWN no konsole....  $NC"
	echo
	echo
	echo -e "$BROWN Lembrete:....  $WHITE "país$GREEN +$WHITE 2014" $NC"
	sleep 5
	    
	vim /home/ahlr/.hubic_credentials
	
	echo -e "$BLUE hubic_credentials $BROWN configurado!  $NC"

	
	
echo
echo	
echo -e "$CYAN # --------- # --------- #  $NC"
echo
echo
	fi
	
	if [ $sshbackup == yes ]; then
	echo -e "$sshbackuptxt"
	echo
	echo -e "$BROWN Abrindo $GREEN sshbackup $BROWN no konsole....  $NC"
	echo
	echo
	echo -e "$BROWN Lembrete:....  $WHITE "Tos$GREEN +$WHITE bag" $NC"
	sleep 5
	    
	vim $dropbox/NET4YOU/NET4YOU/SERVIDOR/SHELL/sshbackup.sh
	
	echo -e "$BLUE sshbackup.sh $BROWN configurado!  $NC"
	
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
# --------- Lista de dependências --------- #
    if [ $bblazenet4you == yes \
   -o $bblazetonico == yes \
   -o $hubiCNET4YOU == yes \
   -o $sshbackup == yes ]; then
      
echo -e "$RED Não esqueça de instalar as dependências! $NC"
echo
echo
echo -e $blazehubicdep
echo -e $sshbackupdep
sleep 5

    fi
    
# --------- Lista de pacotes importantes  --------- #
echo
echo
echo -e "$CYAN PACOTES IMPORTANTES: $NC"
echo
echo -e "$GREEN - VPN => $BROWN NetworkManager-pptp; $NC"
echo -e "$GREEN - Antispam => $BROWN Bogofilter; $NC"
echo -e "$GREEN - Antivírus => $BROWN Clamav; $NC"
echo -e "$GREEN - Conexão Remota => $BROWN Teamviewer; $NC"
echo -e "$GREEN - Rodar arquivos EXE => $BROWN Wine, OpenAL, libva; $NC"
echo -e "$GREEN - pip install -U pip => $BROWN Duplicity e dependências; $NC"
echo
echo
echo

# --------- Apagando arquivos auxiliares no diretório /tmp --------- #
 
    if [ -f "$minilicense" ]; then
	rm $minilicense
    fi
    
    if [ -f "$lpkgs" ]; then
	rm $lpkgs
    fi
    
    if [ -f "$colors" ]; then
	rm $colors
    fi

    
##########################################
#                                        #      
# ----------- Início do fim ------------ #            
#                                        #      
##########################################

    
    ;;
    
    * ) exit;; ## Add whatever other tests you need
  esac
  

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


