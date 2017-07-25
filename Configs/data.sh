#!/bin/sh



# Converte o formato 'dd/mm/AAAA' para 'AAAAmmdd' que e o aceito pela
# opcao '-d' do comando date
data_inicial=`echo "$1" | sed 's:\(..\)/\(..\)/\(....\):\3\2\1:'`
data_final=`echo "$2" | sed 's:\(..\)/\(..\)/\(....\):\3\2\1:'`
valor_mensalidade="$3"

# Converte a data para o formato timestamp que e mais preciso
data_inicial=`date -d "$data_inicial" "+%s"`
data_final=`date -d "$data_final" "+%s"`

dias_corridos=$((($data_final - $data_inicial) / 86400))

# Calculo do valor proporcional
echo "scale = 4; $valor_mensalidade / 30 * $dias_corridos" | bc

exit 1
