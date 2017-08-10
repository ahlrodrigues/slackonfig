#!/bin/bash
####################################################################################
# Autor= Antonio Henrique (Fela)                                                   #
# e-mail: ahlr_2000@yahoo.com                                                      #
#                                                                                  #
# Bugs, Agradecimentos, Críticas "construtivas"                                    #
# Mande me um e-mail. Ficarei Grato!                                               #
#                                                                                  #
# Os scripts deste diretório estão disponíveis na esperança que possam ser úteis,  #
# mas SEM NENHUMA GARANTIA DE FUNCIONAMENTO, SEM NENHUMA GARANTIA DE ADEQUAÇÃO A   #
# QUALQUER MERCADO, SEM NENHUMA GARANTIA DE APLICAÇÃO EM PARTICULAR e NENHUM       #
# SUPORTE TÉCNICO.                                                                 #
####################################################################################
#Mover os arquivos declaração do SICI para a pasta /home/ahlr/Dropbox/NET4YOU/NET4YOU/SCM/SICI
pasta_origem=/home/ahlr/Downloads
pasta_destino=/home/ahlr/Dropbox/NET4YOU/NET4YOU/SCM/SICI
mv $pasta_origem/sici*.xml $pasta_destino 2> /dev/null
