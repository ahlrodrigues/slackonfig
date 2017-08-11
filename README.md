
<div align="center"><img src="https://github.com/ahlrodrigues/slackonfig/blob/master/Imgs/Slackware1.png"></div> 




**SLACKONFIG** - o Scripts para configuração do Slackware GNU/Linux
--------------



**Autor:** Antonio Henrique (Fela)

**E-mail:** ahlr_2000@yahoo.com


Bugs, Agradecimentos, Críticas "construtivas", mande me um e-mail, ficarei Grato!



**Nota:**
----------

  Os scripts deste diretório estão disponíveis na esperança que possam ser úteis, mas SEM NENHUMA GARANTIA DE FUNCIONAMENTO, SEM NENHUMA GARANTIA DE ADEQUAÇÃO A QUALQUER MERCADO, SEM NENHUMA GARANTIA DE APLICAÇÃO EM PARTICULAR e NENHUM SUPORTE TÉCNICO.



**Scripts e Funções:**
----------------------
```
  Neste diretório, constam alguns scripts para configurações básicas, que normalmente realizamos a cada instalação/reinstalação do O.S. Slackware GNU/Linux:

  - Instalação do *Skyline* administrador dos arquivos de remessa (.REM) e de  retorno (.SAI) do BNB;
  - **bnb.sh** => Cria script de inicialização do *Skyline*; 
  - **cleansai.sh** => Cria script que move arquivos de retorno (.SAI) do BNB para a pasta de /home/ahlr/.wine/drive_c/skyline/recebidos;
  - **mvrejsgr.sh** => Mover os arquivos de rejeitados e francesinha do BNB para /home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/BNB/Arquivos;
  - **backupprojetos.sh** => Cria script que realiza backups incrementais da pasta /mnt/sda3/Projetos para o *Dropbox*;
  - **cleansici.sh** => Mover os arquivos declaração do SICI para a pasta /home/ahlr/Dropbox/NET4YOU/NET4YOU/SCM/SICI;
  - **cleanret.sh** => Cria script que move arquivos de retorno (.RET) da CEF para a pasta de /opt/caixa/Recebidos;
  - **cleancache.sh** => Cria script que limpa o cache diariamente;
  - **rc.local\_shutdown** => Cria script que limpa as pastas /tmp do sistema ao realizar shutdown;
  - Configura a data e hora do sistema acrescentando o *pool.ntp.org*  no arquivo /etc/ntp.conf;
  - Inicializa o servidor de impressão *CUPS*;
  - Configura o grupo de trabalho e inicializa o servidor de compartilhamento de arquivos *Samba*;
  - Acrescenta inicialização do "deamon" do *TeamViewer* a cada boot do sistema;
  - Copia os scripts de administração dos mirros locais do *Slackware-current*, *x86_64* e *x86*, para a pasta /usr/local/bin/;
  - Habilita o "init:4" para inicialização do *KDM*;
  - Inicializa o servidor de rede *Networkmanager*;
  - Cria script de calculo data;
  - Cria script de backups e restauracao das configurações do *Thunderbird*;
  - Configuração do "/etc/rc.d/rc.4" para inicialização do KDE como ambiente gráfico;
  - Cria o arquivo de inicialização do *BOIC*;
  - Configuração do *Slackpkg*;
  - Instalação e configuração do *Slackpkg+*;
  - Aplicação do layer para transformar *Slackware* => *Slackware Multilib*;
  - Instalação do *Dropbox*;
  - Instalação do driver da impressora *Brother-DCP7065*;
  - Configura o locale pt-BR nos arquivos *lang.sh* e *lang.csh*;
  - Compilando e Instalando pacotes: *TeamViewer*, *Bogofilter*,
  - Instalando lista de pacotes do arquivo *pkgs.txt: *;
  - Cria a pasta */opt/caixa/Recebidos*;
```


Usage:
------
```
  Baixe o **SLACKONFIG** e rode-o como root para realizar todas as funções programadas por padrão ou escolha no diretório **/Configs** o script que mais lhe agradar.
```


Feature:
--------
```
  - Documentação em cada script;
```


**GNU General Public License:**
-------------------------------

  > Estes scripts/programas são softwares livres, você pode redistribui-los e/ou modifica-los dentro dos termos da GNU - [General Public License](https://pt.wikipedia.org/wiki/GNU_General_Public_License) (Licença Pública Geral GNU)
  >
  > Fundação do Software Livre (FSF): Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA


**Copyright**
-------------

  Copyright&copy; 2017 - See LICENSE for details.