#!/bin/bash
#Move arquivos de retorno da CAIXA
pasta_origem=/home/ahlr/Downloads
pasta_destino=/opt/caixa/Recebidos
cd $pasta_origem && mv *.ret $pasta_destino
