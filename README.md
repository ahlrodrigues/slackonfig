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

Neste diretório, constam alguns scripts para configurações básicas, que normalmente realizamos a cada instalação/reinstalação:
 
- Instalação do *Skyline* administrador dos arquivos de remessa (.REM) e de  retorno (.SAI) do BNB;
- **bnb.sh** => Cria script de inicialização do *Skyline*; 
- **cleanret.sh** => Cria script que move arquivos de retorno (.SAI) do BNB para a pasta de /home/ahlr/.wine/drive_c/skyline/recebidos;
- **configsbackup.sh** => Cria script que realiza backups incrementais da pasta /mnt/sda3/Scripts para o *Dropbox*;
- Cria script que move arquivos de retorno (.RET) da CEF para a pasta de /opt/caixa/Recebidos;
- Cria a pasta "/opt/caixa/Recebidos";
- Cria script que limpa o cache diariamente;
- Configura a data e hora do sistema acrescentando o *pool.ntp.org*  no arquivo /etc/ntp.conf;
- Inicializa o servidor de impressão *CUPS*;
- Configura o grupo de trabalho e inicializa o servidor de compartilhamento de arquivos *Samba*;
- Cria script que limpa as pastas /tmp do sistema ao realizar shutdown;
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
- Instalando lista de pacotes do arquivo *pkgs.txt*;


**Future:**
-----------



**GNU General Public License:**
-------------------------------

Estes scripts/programas são softwares livres, você pode redistribui-los e/ou modifica-los dentro dos termos da GNU - [General Public License](https://pt.wikipedia.org/wiki/GNU_General_Public_License) (Licença Pública Geral GNU)

Fundação do Software Livre (FSF): Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

