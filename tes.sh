#!/usr/bin/bash

source __main__.sh; {
	eval Bot || { cat <<< "[!] Gagal setup"; exit; }
}

while read -p "input : " inp; do
	Bot.config "sc/config.ash" "$inp"
	reply=$(Bot.App.run)
	if test "$inp" == "keluar"; then
		exit
	else echo "Bot   : $reply"; continue; fi
done
