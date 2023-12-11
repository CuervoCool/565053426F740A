#!/bin/bash
linea="━━━━━━━━━━━━━━━━━━━━━━━━";LINE=$linea;LINEA=$linea;SRC="sources"
tit="⠀⠀⠀⠀⠀⠀◍ ᴅᴏɴᴘᴀᴛᴏʙᴏᴛ ◍"
source ShellBot.sh
source ${SRC}/menu
source ${SRC}/ayuda
source ${SRC}/cache
source ${SRC}/invalido
source ${SRC}/status
source ${SRC}/reinicio
source ${SRC}/myip
source ${SRC}/id
source ${SRC}/back_ID
source ${SRC}/link
source ${SRC}/listID
source ${SRC}/gerar_key
source ${SRC}/power
source ${SRC}/comandos
source ${SRC}/update
source ${SRC}/donar
source ${SRC}/costes
#source ${SRC}/kill_drop.sh

# Token del bot
bot_token="$(cat ./token)"
CID="./User-ID"
# Inicializando el bot
echo -ne "\e[1;33mINICIANDO BOT: \e[1;32m${tit}";ShellBot.init --token "$bot_token" --monitor --flush --return map;echo -e "[✓] CON EXITO [✓]"
ShellBot.username
reply () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}

		 	 ShellBot.sendMessage	--chat_id  $var \
									--text "$comando" \
									--parse_mode html \
									--reply_markup "$(ShellBot.ForceReply)"
	[[ "${callback_query_data}" = /del || "${message_text}" = /del ]] && listID_src
	#[[ "${callback_query_data}" = /img || "${message_text}" = /img ]] && listID_src
	[[ "${callback_query_data}" = '/banIP' || "${message_text}" = '/banIP' ]] && list_IP
	
}




menu_print () {
[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}

	if [[ $(echo $permited|grep "${chatuser}") = "" ]]; then
				# ShellBot.sendMessage 	--chat_id ${message_chat_id[$id]} \
				ShellBot.sendMessage 	--chat_id $var \
										--text "$(echo -e $bot_retorno)" \
										--parse_mode html \
										--reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_user')"
	else
				# ShellBot.sendMessage 	--chat_id ${message_chat_id[$id]} \
				ShellBot.sendMessage 	--chat_id $var \
										--text "$(echo -e $bot_retorno)" \
										--parse_mode html \
										--reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_conf')"
	fi
}

menu_printSN () {
[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}

	if [[ $(echo $permited|grep "${chatuser}") = "" ]]; then
				ShellBot.sendMessage 	--chat_id $var \
				--text "$(echo -e $bot_retorno)" \
				--parse_mode html \
				--reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_send_id')"
	fi
}


download_file () {
# shellbot.sh editado linea 3986
user=User-ID
[[ -e ${CID} ]] && rm ${CID}
local file_id
          ShellBot.getFile --file_id ${message_document_file_id[$id]}
          ShellBot.downloadFile --file_path "${return[file_path]}" --dir "."
		  [[ -e ${return[file_path]} ]] && mv ${return[file_path]} ${CID}
local bot_retorno="ID user botgen\n"
		bot_retorno+="$LINE\n"
		bot_retorno+="Se restauro con exito!!\n"
		bot_retorno+="$LINE\n"
		bot_retorno+=" FILE ${return[file_path]} \n"
		bot_retorno+="$LINE"
			ShellBot.sendMessage	--chat_id "${message_chat_id[$id]}" \
									--reply_to_message_id "${message_message_id[$id]}" \
									--text "$(echo -e $bot_retorno)" \
									--parse_mode html
return 0
}


msj_add () {
	      ShellBot.sendMessage --chat_id ${1} \
							--text "<i>$(echo -e $bot_retor)</i>" \
							--parse_mode html
}

upfile_fun () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
          ShellBot.sendDocument --chat_id $var  \
                             --document @${1} \
                             #--caption  "$(echo -e "$bot_retorno")" \
                             #--parse_mode html \
                             #--reply_markup "$(ShellBot.ForceReply)"
							 #--reply_markup "$(ShellBot.InlineKeyboardMarkup -b "$2")"							 
}

upimg_fun () {
          ShellBot.sendDocument --chat_id $(cat ./Admin-ID)  \
                             --document @${1} \
                             #--caption  "$(echo -e "$bot_retorno")" \
                             #--parse_mode html \
                             #--reply_markup "$(ShellBot.ForceReply)"
							 #--reply_markup "$(ShellBot.InlineKeyboardMarkup -b "$2")"							 
}

invalido_fun () {
MSG_id=$((${message_message_id} + 1 ))
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
	local bot_retorno="$linea\n$tit\n$linea\n❌ <b><ins>comando inválido</ins></b> ❌"
		bot_retorno+="$LINE\n"
#        bot_retorno+=" COMANDO NO PERMITIDO !!\n Quizas debes usar este /keygen \n O Posiblemente no estas Autorizado, clic aqui /prices o \n Contacta a $(cat < /etc/ADM-db/resell) y adquiere una subscripcion \n Toca aqui para ayuda /ayuda \n"
        bot_retorno+="$LINE\n"
	    ShellBot.sendMessage --chat_id $var \
							--text "$(echo -e $bot_retorno)" \
							--parse_mode html
		sleep 5s
		msj_del ${message_message_id}
		msj_del ${MSG_id}
							return 0	
}


send_admin(){

	local bot_retorno2="$LINE\n"
	bot_retorno2+="🔰 Solicitud de autorizacion 🔰\n"
	bot_retorno2+="$LINE\n"
	bot_retorno2+="<u>Nombre</u>: ${callback_query_from_first_name}\n"
	[[ ! -z ${callback_query_from_username} ]] && bot_retorno2+="<u>Alias</u>: @${callback_query_from_username}\n"
	bot_retorno2+="<u>ID</u>: <code>${callback_query_from_id}</code>\n"
	bot_retorno2+="$LINE"

	bot_retorno="$LINE\n"
	bot_retorno+="     🔰 Bot generador de key 🔰\n"
	bot_retorno+="           ⚜ by @drowkid01 ⚜\n"
	bot_retorno+="$LINE\n"
	bot_retorno+="      ✅ ID enviado al admin ✅\n"
	bot_retorno+="$LINE"
	comand_boton "atras"

	saveID "${callback_query_from_id}"
	var=$(cat < ./Admin-ID)
	ShellBot.sendMessage 	--chat_id $var \
							--text "$(echo -e "$bot_retorno2")" \
							--parse_mode html \
							--reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_save_id')"

	return 0
}


msj_fun () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
		      ShellBot.sendMessage --chat_id $var \
							--text "$(echo -e "$bot_retorno")" \
							--parse_mode html
	return 0
}

msj_del () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
		      ShellBot.deleteMessage --chat_id $var --message_id $1 			  
	return 0
}

msj_img () {
#${timg}/id_${usrLOP}.png
local file_id
          ShellBot.getFile --file_id "$1"
          #ShellBot.downloadFile --file_path "${return[file_path]}" --dir "${timg}/id_${usrLOP}.png"
		  #[[ -e ${return[file_path]} ]] && mv ${return[file_path]} "${timg}/id_${usrLOP}.png1"

	#[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
		      #ShellBot.sendPhoto --chat_id $var --photo @${timg}/id_${usrLOP}.png
			  #ShellBot.deleteMessage --chat_id $var --message_id $1
			  upimg_fun
local bot_retorno="ID user botgen\n"
		bot_retorno+="$LINE\n"
		bot_retorno+="Se restauro con exito!!\n"
		bot_retorno+="$LINE\n"
		bot_retorno+=" FILE ${return[file_path]} \n"
		bot_retorno+="$LINE"
			ShellBot.sendMessage	--chat_id "${message_chat_id[$id]}" \
									--reply_to_message_id "${message_message_id[$id]}" \
									--text "$(echo -e $bot_retorno)" \
									--parse_mode html	
	
	return 0
}

msj_chat () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
		      ShellBot.sendChatAction --chat_id $var --action typing
			  #ShellBot.deleteMessage --chat_id $var --message_id $1 
	return 0
}

msj_donar () {
	[[ ! -z ${callback_query_message_chat_id[$id]} ]] && var=${callback_query_message_chat_id[$id]} || var=${message_chat_id[$id]}
	      ShellBot.sendMessage --chat_id $var \
							--text "<i>$(echo -e "$bot_retorno")</i>" \
							--parse_mode html \
							--reply_markup "$(ShellBot.InlineKeyboardMarkup -b 'botao_donar')"
	return 0
}


saveID(){
	unset botao_save_id
	botao_save_id=''
	ShellBot.InlineKeyboardButton 	--button 'botao_save_id' --line 1 --text "Autorizar ID" --callback_data "/saveid $1"
}


botao_conf=''
botao_user=''
botao_donar=''
unset botao_send_id
botao_send_id=''
ShellBot.InlineKeyboardButton --button 'botao_send_id' --line 1 --text "ENVIAR al ADM" --callback_data '/sendid'
ShellBot.InlineKeyboardButton --button 'botao_send_id' --line 1 --text "menu" --callback_data '/menu'

ShellBot.InlineKeyboardButton --button 'botao_conf' --line 1 --text 'NEW ID' --callback_data '/add'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 1 --text 'QUITAR 🗑' --callback_data '/del'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 1 --text 'LISTAR 📋' --callback_data '/list'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 1 --text ' 🔎 ID' --callback_data '/buscar'

ShellBot.InlineKeyboardButton --button 'botao_conf' --line 2 --text ' ✅ | ❌ ' --callback_data '/power'
ShellBot.InlineKeyboardButton --button 'botao_conf' --line 2 --text 'MENU' --callback_data '/menu'

ShellBot.InlineKeyboardButton --button 'botao_conf' --line 3 --text '🔑 GEN KEY 🔑' --callback_data '/keygen'
ShellBot.InlineKeyboardButton --button 'botao_user' --line 1 --text '🔑 GEN KEY 🔑' --callback_data '/keygen'
ShellBot.InlineKeyboardButton --button 'botao_user' --line 2 --text ' 🧿 Ban|IP 📲' --callback_data '/banIP' # '1' --url "https://t.me/$(cat < /etc/ADM-db/resell)"
ShellBot.InlineKeyboardButton --button 'botao_user' --line 2 --text ' 🛒 CATALOGO 📝 ' --callback_data  '1' --url "$(cat < /etc/urlCT)"
ShellBot.InlineKeyboardButton --button 'botao_user' --line 3 --text '💰 DONAR 💰' --callback_data  '1' --url "$(cat < /etc/urlDN)"
ShellBot.InlineKeyboardButton --button 'botao_user' --line 3 --text ' 🪀 WTS 📲' --callback_data  '1' --url "https://wa.me/$(cat < /etc/numctc)"
ShellBot.InlineKeyboardButton --button 'botao_user' --line 3 --text ' MENU ' --callback_data '/menu'

#ShellBot.InlineKeyboardButton --button 'botao_user' --line 2 --text ' Contacto 📲' --callback_data  '1' --url 'https://wa.me/593987072611?text=Hola!,%20ℂ𝕙𝕦𝕞𝕠𝔾ℍ%20Me%20interesa%20Conocer%20más%20sobre%20el%20ADM.'
ShellBot.InlineKeyboardButton --button 'botao_donar' --line 2 --text 'Donar Paypal' --callback_data '1' --url "$(cat < /etc/urlDN)"
ShellBot.InlineKeyboardButton --button 'botao_donar' --line 2 --text 'ACCEDER WHATSAPP' --callback_data '1' --url "https://wa.me/$(cat < /etc/numctc)"

# Ejecutando escucha del bot
while true; do
    ShellBot.getUpdates --limit 100 --offset $(ShellBot.OffsetNext) --timeout 30
    for id in $(ShellBot.ListUpdates); do
	    chatuser="$(echo ${message_chat_id[$id]}|cut -d'-' -f2)"
	    [[ -z $chatuser ]] && chatuser="$(echo ${callback_query_from_id[$id]}|cut -d'-' -f2)"
	    echo $chatuser >&2
	    #echo "user id $chatuser"

	    comando=(${message_text[$id]})
	    [[ -z $comando ]] && comando=(${callback_query_data[$id]})
	    #echo "comando $comando"

	    [[ ! -e "./Admin-ID" ]] && echo "null" > ./Admin-ID
	    permited=$(cat ./Admin-ID | awk '{print $1}')
	    comand
    done
done
