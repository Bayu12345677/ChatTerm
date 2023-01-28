#!/usr/bin/bash

# environtment
config=""
total_array=""
reply=""
send=""
__MYCONFIG__=""
__MYINPUT__=""
let random_msg=0

# oop bot chat mechanize
function Bot()
{
	function __init__(){
		shopt -s expand_aliases
		shopt -s checkwinsize

		alias Bot.config="Bot::Config"
		alias Bot.App.run="Bot::run"
	}

	Bot::run(){
		# 0,0,1,0 = pesan
		# 0,0,2,0 = jawaban
		#source "$__MYCONFIG__" || { echo "[!] Error config"; exit 33; }
		unset __validasi__
		input="$__MYINPUT__"
		local reply send

		source "$__MYCONFIG__" || { echo "[!] Error config"; exit; }
		total_array=$(cat "$__MYCONFIG__"|grep -o "msg[[0-9]]*")

		for __validasi__ in ${total_array}; do
			eval app_reply="\${${__validasi__}[0,0,1]}"
			eval app_send="\${${__validasi__}[0,0,2]}"
			eval reply=(${app_reply})
			eval send=(${app_send})
			#echo "${msg1[0,0,1]}"
			for __cek__ in "${reply[@]}"; do
				if [[ "$input" =~ $__cek__ ]]; then
					total_send=$(tr "[[:space:]]" "\n" <<< "${!send[@]}"|sort -nr|head -1)
					reply_send="${send[$(shuf -i 0-${total_send} -n 1)]}"
					cat <<< "$reply_send"
					status="true"
					break
				else status="false"; fi
			done
				if test "$status" == "true"; then
					break
				else true; fi
		done

		if test "$status" == "true"; then return 0; else { cat <<< "Saya Tidak mengerti tolong ajari saya di config.ash"; return 1; };fi
		unset input
		unset status
	}

	Bot::Config(){ __MYCONFIG__="$1" __MYINPUT__=$(tr "A-Z" "a-z" <<< "$2"); }

	eval __init__ || { echo "[+] Error"; exit; }
}

# cara penggunaan :
# 1. import modul bot chat menggunakan perintah source
# 2. setup bot chat
#    :
#		eval Bot || { cat <<< "[!] Error"; }
#       read -p "input : "inp
#       Bot.config "config.ash" "$inp"
#       reply=$(Bot.App.run)
#       echo "Bot : $reply"



