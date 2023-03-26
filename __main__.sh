#!/usr/bin/bash

# Author Bayu Rizky A.M
# Youtube : Pejuang Kentang

#                    GNU GENERAL PUBLIC LICENSE
#                       Version 3, 29 June 2007

# Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
# Everyone is permitted to copy and distribute verbatim copies
# of this license document, but changing it is not allowed.

#                            Preamble

#  The GNU General Public License is a free, copyleft license for
#software and other kinds of works.

#  The licenses for most software and other practical works are designed
#to take away your freedom to share and change the works.  By contrast,
#the GNU General Public License is intended to guarantee your freedom to
#share and change all versions of a program--to make sure it remains free
#software for all its users.  We, the Free Software Foundation, use the
#GNU General Public License for most of our software; it applies also to
#any other work released this way by its authors.  You can apply it to
#your programs, too.

#  When we speak of free software, we are referring to freedom, not
#price.  Our General Public Licenses are designed to make sure that you
#have the freedom to distribute copies of free software (and charge for
#them if you wish), that you receive source code or can get it if you
#want it, that you can change the software or use pieces of it in new
#free programs, and that you know you can do these things.

#  To protect your rights, we need to prevent others from denying you
#these rights or asking you to surrender the rights.  Therefore, you have
#certain responsibilities if you distribute copies of the software, or if
#you modify it: responsibilities to respect the freedom of others.

#  For example, if you distribute copies of such a program, whether
#gratis or for a fee, you must pass on to the recipients the same
#freedoms that you received.  You must make sure that they, too, receive
#or can get the source code.  And you must show them these terms so they
#know their rights.

#  Developers that use the GNU GPL protect your rights with two steps:
#(1) assert copyright on the software, and (2) offer you this License
#giving you legal permission to copy, distribute and/or modify it.

#  For the developers' and authors' protection, the GPL clearly explains
#that there is no warranty for this free software.  For both users' and
#authors' sake, the GPL requires that modified versions be marked as
#changed, so that their problems will not be attributed erroneously to
#authors of previous versions.

#  Some devices are designed to deny users access to install or run
#modified versions of the software inside them, although the manufacturer
#can do so.  This is fundamentally incompatible with the aim of
#protecting users' freedom to change the software.  The systematic
#pattern of such abuse occurs in the area of products for individuals to
#use, which is precisely where it is most unacceptable.  Therefore, we
#have designed this version of the GPL to prohibit the practice for those
#products.  If such problems arise substantially in other domains, we
#stand ready to extend this provision to those domains in future versions
#of the GPL, as needed to protect the freedom of users.

#  Finally, every program is threatened constantly by software patents.
#States should not allow patents to restrict development and use of
#software on general-purpose computers, but in those that do, we wish to
#avoid the special danger that patents applied to a free program could
#make it effectively proprietary.  To prevent this, the GPL assures that
#patents cannot be used to render the program non-free.

#  The precise terms and conditions for copying, distribution and
#modification follow.

#                       TERMS AND CONDITIONS

#  0. Definitions.
#
#  "This License" refers to version 3 of the GNU General Public License.

#  "Copyright" also means copyright-like laws that apply to other kinds of
#works, such as semiconductor masks.

#  "The Program" refers to any copyrightable work licensed under this
#License.  Each licensee is addressed as "you".  "License

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
		total_array=$(cat "$__MYCONFIG__"|grep -o "msg[0-9]*")

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
					if grep -o "[1-9]" <<< "${!send[@]}" &>/dev/null; then
						echo "$reply_send"
					else
						eval send_1="$app_send"
						echo -e "$send_1"
					fi
					echo "${!send[@]}" > log
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



