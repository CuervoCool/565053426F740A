#!/bin/bash
lista="cache id menu status BotGen.sh comandos invalido myip update ShellBot.sh costes kill_drop.sh power ayuda donar link reinicio back_ID gerar_key listID"
	for arx in $lista; do
	ln -s $(pwd)/$arx sources/$arx
	done
