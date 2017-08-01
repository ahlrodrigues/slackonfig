**Scripts para configuração do Slackware-current_x86_64**
=================================================

**Autor:** Antonio Henrique (Fela)

**E-mail:** ahlr_2000@yahoo.com

Bugs, Agradecimentos, Críticas "construtivas", mande me um e-mail, ficarei Grato!

----------

**Cuidado:**

Os scripts deste diretório estão disponíveis na esperança que possam ser úteis, mas SEM NENHUMA GARANTIA DE FUNCIONAMENTO; SEM NENHUMA GARANTIA DE ADEQUAÇÃO A QUALQUER MERCADO, SEM NENHUMA GARANTIA APLICAÇÃO EM PARTICULAR ou SUPORTE TÉCNICO.

----------

**Scripts:**

Neste diretório, constam alguns scripts para configurações básicas que normalmente realizamos a cada instalação/reinstalação:
 
- Instalação do *Skyline* administrador dos arquivos de remessa (.REM) e retorno (.SAI) do BNB;
- Cria script de inicialização do *Skyline*;
- Move arquivos de retorno (.SAI) do BNB para a pasta de /home/ahlr/.wine/drive_c/skyline/recebidos;
- Cria script que realiza backups incrementais da pasta /mnt/sda3/Scripts para o *Dropbox*;
- Move arquivos de retorno (.RET) da CEF para a pasta de recebidos;
- Cria a pasta "/opt/caixa/Recebidos" para os arquivos de retorno da CEF e dá permissão de execucao;
- Cria script que limpa o cache diariamente;
- Configura a data e hora acrescentando o *pool.ntp.org*  no arquivo /etc/ntp.conf;
- Inicializa o servidor de impressão *CUPS*;
- Configura o grupo de trabalho e inicializa o servidor de compartilhamento de arquivos *Samba*;
- Cria script que limpa as pastas /tmp do sistema ao realizar shutdown;
- Acrescenta inicialização do *TeamViewer* a cada inicialização do sistema;
- Copia os scripts de administração dos mirros locais do *Slackware-current_x86_64* e *Slackware-current_x86*;
- Habilita o init:4 para inicialização do *KDM*;
- Inicializa o servidor de rede *Networkmanager*;
- Cria script de calculo data;
- Cria script de backups e restauracao do *Thunderbird*;
- Configuração do rc.4 para inicialização do KDE como ambiente gráfico;
- Cria o arquivo de inicialização do *BOIC*;
- Configuração do *Slackpkg*;
- Instalação e configuração do *Slackpkg+*;
- Aplicação do layer para o *Slackware Multilib*;
- Instalação do *Dropbox*;
- Instalação da impressora *Brother-DCP7065*;



----------

**GNU General Public License:**

Estes scripts/programas são softwares livres; você pode redistribui-los e/ou modifica-los dentro dos termos da GNU - [General Public License](https://pt.wikipedia.org/wiki/GNU_General_Public_License) (Licença Pública Geral GNU)

Fundação do Software Livre (FSF): Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

----------