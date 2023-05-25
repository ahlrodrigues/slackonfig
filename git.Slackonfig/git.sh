#!/bin/bash

echo "Entrando no diretório..."
cd ~/Dropbox/slackonfig/

echo "Listando arquivos modificados..."
git add .

echo "Comentando o commit..."
git commit -m "UPDATES AND UPGRADES"

echo "Atualizando repositório..."
git push master
