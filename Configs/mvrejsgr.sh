#!/bin/bash
#Mover os arquivos de rejeitados e francesinha do BNB
pasta_origem=/home/ahlr/Downloads
pasta_destino=/home/ahlr/Dropbox/NET4YOU/NET4YOU/Bancos/BNB/Arquivos
mv $pasta_origem/rel*.pdf  $pasta_origem/Rejeitados-`date +%d_%m`.pdf 2> /dev/null
mv $pasta_origem/sgr*.pdf  $pasta_origem/Francesinha-`date +%d_%m`.pdf 2> /dev/null
mv $pasta_origem/Francesinha*.pdf $pasta_destino 2> /dev/null
mv $pasta_origem/Rejeitados*.pdf $pasta_destino 2> /dev/null
