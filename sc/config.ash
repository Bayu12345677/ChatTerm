# ini merupakan config dari Ai
# untuk type config nya berupa array
# arti element :
#   [0,0,1] => input yg akan di ketik user
#   [0,0,2] => lawan kata yg akan di kirim ke user

# penjelasan config :
#   disini anda dapat mengekspresikan pilihan anda secara bebas
#   karena config ini anda bisa membuat sebuah fungsi ataupun
#   sebuah kosa kata yg canggih.
#   tapi perlu di ingat nama array harus sama dengan angka yg berurutan
#   tidak boleh sama dan pastikan saat membuat fungsi harus benar benar
#   teliti agar nanti nya tidak terjadi error logic.
#   dan di dalam value element anda bisa menambahkan prediksi kata
#   dengan cara menggunakan double string di dampingi menggunakan karakter backspace
#   example : \"halo\", setiap 1 string itu sama dengan 1 index element baru
#   jadi anda bisa menambahkan sebuah pola regexp di dalam element prediksi
#   ini hanya berlaku di element prediksi.
#   sedangkan element reply (jawaban) double string backspace hanya berfungsi untuk
#   sebuah kata yg mengandung spasi (space) tujuan nya agar tidak di anggap array oleh
#   mekanisme dari file main dan anda bisa membuat beberapa element baru di dalam 1 index element
#   di bagian reply yg tujuan nya memberi jawaban lebih dari 1

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
#License.  Each licensee is addressed as "you".  "License"

#tempat fungsi / variabel

function GAMES(){
	function __init__(){
		shopt -s expand_aliases

		alias Games.ganteng="GAMES::ganteng"
		alias Games.seberapa.ganteng="GAMES::seberapa::ganteng"
		alias Games.batu.gunting="GAMES::batu::gunting"
	}

	GAMES::ganteng()
	{
		#hasil 1
		((__result__ = $RANDOM % 252))
		#hasil 2
		((__result__ = __result__ / 2))
		#hasil 3
		((__result__ = __result__ > 100 ? 100 : __result__))

		if ((__result__ >= 70)); then local penentu="ganteng banget [$__result__]"
		elif ((__result__ >= 50)); then local penentu="ganteng [$__result__]"
		elif ((__result__ >= 10)); then local penentu="b aja [$__result__]"
		elif ((__result__ >= 5)); then local penentu="jelek banget [$__result__]"; fi

		cat <<< "$penentu"

		unset penentu
	}

	GAMES::seberapa::ganteng()
	{
		let acak=(RANDOM % 252)
		
		((__penentu__ = acak / 4))
		((__h1__ = __penentu__ > 100 ? 100 : __penentu__ - 2))
		((__h2__ = __h1__ < 50 ? 0 : 1))
		
		local array=("dia" "kamu")

		cat <<< "${array[$__h2__]}"
	}

	GAMES::batu::gunting()
	{
		local myinput="$input"

		local batu=$(grep -o "\[batu\]" <<< "$myinput")
		local kertas=$(grep -o "\[kertas\]" <<< "$myinput")
		local gunting=$(grep -o "\[gunting\]" <<< "$myinput")

		local match="${batu:-${gunting:-${kertas}}}"
		
		local arrayBatu=(
			"batu [seri]"
			"kertas [easy]"
			"kertas [easy]"
			"gunting [aduh kalah gua]"
			"batu [sama bang]"
			"kertas [mudah kali]"
			"kertas [mudah kali]"
			"gunting [dahlah]"
		)

		local arrayGunting=(
			"batu [yahaha so easy]"
			"batu [yahaha so easy]"
			"gunting [seri]"
			"kertas [ampun suhu]"
			"batu [mudah banget]"
			"batu [mudah banget]"
			"gunting [yah seri]"
			"kertas [:(]"
		)

		local arrayKertas=(
			"batu [yah kalah gua]"
			"gunting [ez cuy]"
			"gunting [ez cuy]"
			"kertas [seri kita]"
			"batu [citer lu]"
			"gunting [ez banget]"
			"gunting [ez banget]"
			"kertas [yaelah seri]"
		)

		if test "${match}" == "[batu]"; then
			function matchj(){ let totalBatu=$(grep -o "[0-9]" <<< "${!arrayBatu[@]}"|sort -nr|head -1); let randomJb=$(shuf -i 0-${totalBatu} -n 1); cat <<< "${arrayBatu[$randomJb]}"; }
			local matchJb=("$(matchj)" "$(matchj)")
			((r = RANDOM % 11 / 2))
			((j = r > 3 ? r : 3))
			((b = j < 0 ? j + 1 : j))
			((g = 4 - b))
			cat <<< "${matchJb[$g]}"
		elif test "${match}" == "[gunting]"; then
			function matchj(){ let totalBatu=$(grep -Po "[0-9]" <<< "${!arrayGunting[@]}"|sort -nr|head -1); let randomJb=$(shuf -i 0-${totalBatu} -n 1); cat <<< "${arrayGunting[$randomJb]}"; }
			local matchJb=("$(matchj)" "$(matchj)")
			((r = RANDOM % 11 / 2))
			((j = r > 3 ? r : 3))
			((b = j < 0 ? j + 1 : j))
			((g = 4 - b))
			cat <<< "${matchJb[$g]}"
		elif test "${match}" == "[kertas]"; then
			function matchj(){ let totalBatu=$(grep -Po "[0-9]" <<< "${!arrayKertas[@]}"|sort -nr|head -1); let randomJb=$(shuf -i 0-${totalBatu} -n 1); cat <<< "${arrayKertas[$randomJb]}"; }
			local matchJb=("$(matchj)" "$(matchj)")
			((r = RANDOM % 11 / 2))
			((j = r > 3 ? r : 3))
			((b = j < 0 ? j + 1 : j))
			((g = 4 - b))
			cat <<< "${matchJb[$g]}"
		else {
			cat <<< "choice : [batu], [gunting], [kertas] > example : [batu]"
		}; fi
			
	}
	
	eval __init__
}

function mtk(){
	# ask : berapa
	local myinput="$input"

	# data pertanyaan
	function f1(){ dinput=$(grep -Po '(tambah|\+|jumlah|bagi|\/|kali|\*|kurang|-|modulus|\%|x|\:)' <<< "$myinput"); }
	function f2(){ soal1=$(grep -Po '[0-9]*' <<< "$myinput"|tail +1|head -1); }
	function f3(){ soal2=$(grep -Po '[0-9]*' <<< "$myinput"|tail +2|head -1); }

	if grep -o "mtk" <<< "$myinput" &>/dev/null; then
		# mencari nilai inti
		local datacore=$(sed 's/[a-zA-Z]*//g;s/[[:space:]].^[0-9]//' <<< "$myinput")
		local value=$(echo "$datacore")

		eval "echo \$(($value))" 2>/dev/null
	else	
	{ f1; f2; f3; }
	
	# penentuan data operator
	if { test "$dinput" == "tambah"; } || { test "$dinput" == "+"; } || { test "$dinput" == "jumlah"; }
	then
		cat <<< "$((soal1 + soal2))"
	elif { test "$dinput" == "kurang"; } || { test "$dinput" == "-"; }
	then
		cat <<< "$((soal1 - soal2))"
	elif { test "$dinput" == "bagi"; } || { test "$dinput" == "/"; } || { test "$dinput" == ":"; }
	then
		cat <<< "$((soal1 / soal2))"
	elif { test "$dinput" == "kali"; } || { test "$dinput" == "*"; } || { test "$dinput" == "x"; }
	then
		cat <<< "$((soal1 * soal2))"
	elif { test "$dinput" == "modules"; } || { test "$dinput" == "%"; }
	then
		cat <<< "$((soal1 % soal2))" || { cat <<< "[!] Operator dan value tidak valid"; }
	else eval "$myinput" 2>/dev/null || true
	fi
		fi
}

function MainMenu(){
	local menu=$(cat <<< "
	     [ • List Menu • ]
	     
	-> mtk (example: mtk 5 + 5)
	-> batu gunting kertas
	-> seberapa ganteng gua
	-> search (example: search apa itu bash)
	-> seberapa ganteng #objek (example: seberapa ganteng aldo)
	-> informasi terkini
	-> comming soon")

	echo "$menu"
}
# oop fungsi umum
function Fungsi()
{
	function __init__(){
		shopt -s expand_aliases

		alias Fungsi.App.Date="Fungsi::data"
		alias Fungsi.App.time="Fungsi::waktu"
		alias Fungsi.App.now="Fungsi::now"
		alias Fungsi.App.search="Fungsi::search"
	}

	Fungsi::data(){
		cat < <(date +%d/%m/%Y)
	}

	Fungsi::waktu(){
		cat < <(date +%H:%M)
	}

	Fungsi::now(){
		local waktu=$(date +%H)
		local dataWaktu=$(date +%H:%M)
		local datazona=$(date +%p)
		local hari=$(date +%a|tr "A-Z" "a-z"|head -c 3)

		function AiTime(){
			local args="$argsAi"
			case ${args} in
							03|3|04|4|05|5|06|6|07|7|08|8|09|9|10) statusW="pagi" ;;
							11|12|13|14) statusW="siang" ;;
							15|16|17) statusW="sore" ;;
							18|19|20|21|22|23) statusW="malam" ;;
							00|0|01|02|1|2) statusW="tengah malam" ;;
			esac

			return 0
		}

		local argsAi="$waktu"
		eval AiTime

		case $hari in
					sun) statusH="minggu" ;;
					mon) statusH="senin" ;;
					tue) statusH="selasa" ;;
					wed) statusH="rabu" ;;
					thu) statusH="kamis" ;;
					fri) statusH="jumat" ;;
					sat) statusH="sabtu" ;;
		esac

		# cuaca
		# databases type
		: [0,1,1] = kota
		: [0,1,2] = cuaca
		: [0,1,3] = suhu
		: [0,1,4] = angin
		: [0,1,5] = sunset
		: [0,1,6] = sunrise
		
		local address=$(curl -sL ifconfig.me)
		local resp=$(curl -sL --compressed --url "https://www.weatherdatasource.com/${address}")
		local data1=$(grep -Po "[a-zA-Z]*\.[[:space:]][0-9].*" <<< "$resp"|sed 's/\/>.*//g'|tr -d "\n"|tr -d "\"")
		local data2=$(grep -o "Sun.*" <<< "$resp"|sed 's/<.*//g;s/,//g')
		
		let arr1=1
		let arr2=1

		# data 1
		: @1 = cuaca
		: @2 = suhu
		: @3 = angin
		
		# data 2
		: @1 = sunrise
		: @2 = sunset
		
		for array1 in "${data1}"; do { DataArray1[$arr1]="$array1"; let arr1++; }; done
		for array2 in "${data2}"; do { DataArray2[$arr2]="$array2"; let arr2++; }; done
		
		local city=$(grep -Po '(?<=<h2 class="text-white" style="margin-left:10px; padding-top:10px;">)[^}.]*' <<< "$resp"|cut -d "<" -f 1|sed 's/>.*//g')
		local database=(
			[0,1,1]=$(cat <<< "$city")
			[0,1,2]=$(cat <<< "${DataArray1[1]}")
			[0,1,3]=$(cat <<< "${DataArray1[2]}")
			[0,1,4]=$(cat <<< "${DataArray1[3]}")
			[0,1,5]=$(cat <<< "${DataArray2[1]}")
			[0,1,6]=$(cat <<< "${DataArray2[2]}"|tr -d ",")
		)

		local Date=$(grep -Po '(?<=<p style="margin-left:10px; color:#fff; display:block; font-size:9pt;">)[^}.]*' <<< "$resp"|cut -d "<" -f 1|cut -d " " -f 1)
		local timesC=$(grep -Po '(?<=<p style="margin-left:10px; color:#fff; display:block; font-size:9pt;">)[^}.]*' <<< "$resp"|cut -d ":" -f 1|cut -d " " -f 2)

		if curl -sL google.com -o /dev/null; then
			local argsAi="$waktu"
			eval AiTime

			cat <<< "Hari [$statusH] | waktu kini (${Date}. $dataWaktu $datazona) $statusW | inf [${database[0,1,1]},${database[0,1,2]},${database[0,1,5]},${database[0,1,6]}]"|tr -d '"'|sed 's/>.*//g'|head -2|sed 's/\\n/ /g'
		else
			cat <<< "Hari [$statusH] | waktu kini ($dataWaktu $datazona) $statusW"
		fi
	}

	Fungsi::search(){
		local Myinput="$input"
		local getanswer=$(grep -Eo '[[:space:]].*' <<< "$Myinput"|sed 's/[[:space:]]//')
		local query=$(sed 's/[[:space:]]/+/g' <<< "$getanswer")

		local sethost="www.google.com"
		local setua="Mozilla/5.0 (Linux; U; Android 4.2.2; ME302KL Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Chrome/ Safari/534.30 OPR/60.0.2254.59405"
		local seturl="https://www.google.com/search?q=${query}&rlz=1C1CHBF_enID1024ID1024&oq=&aqs=chrome.1.35i39i362l8.291790j0j7&sourceid=chrome&ie=UTF-8"

		local resp=$(curl -sL --header "host: $sethost" --header "user-agent: $setua" --insecure --compressed --url "$seturl")
		#local parser=$(echo "$resp"|html2text|grep -Eo '[A-Z0-9][a-z]*[[:space:]](merupakan|adalah|yaitu|karena|pada) [a-zA-Z]* .*')
		#local parser=$(echo -e "$(grep -Po '(?<=\\x3cdiv class\\x3d\\x22BNeawe s3v9rd AP7Wnd\\x22\\x3e\\x3cdiv\\x3e\\x3cdiv class\\x3d\\x22BNeawe s3v9rd AP7Wnd\\x22\\x3e)[^},]*' <<< "$resp")"|html2text|head -5)
		local parser=$(echo -e $(grep -A1 '\\x3cdiv class\\x3d\\x22BNeawe.*' <<< "$resp"|sed -n '1p;3p')|grep -Eo '<div class="BNeawe [a-zA-Z0-9]* AP7Wnd">.*'|sed 's/<\/div>.*//g'|sed 's/<[^>]\+>//g')
		let processarray=0

		for data1 in "$parser"; do
			database[$processarray]="$data1"
			let processarray++
		done

		if curl -sL google.com -o /dev/null; then
			cat <<< "> $parser"
			#echo -e "$(grep -Po '(?<=\\x3cdiv class\\x3d\\x22BNeawe s3v9rd AP7Wnd\\x22\\x3e\\x3cdiv\\x3e\\x3cdiv class\\x3d\\x22BNeawe s3v9rd AP7Wnd\\x22\\x3e)[^},]*' <<< "$resp")"|html2text|head -4
		else
			cat <<< "mohon aktifkan koneksi internet anda"
		fi
	}
	eval __init__
}

eval Fungsi
eval GAMES


#tempat konektor
msg1=(
	[0,0,1]="\"halo$\" \"halo bot$\""
	[0,0,2]="\"halo juga\" \"halo\" \"ya\""
)
msg2=(
	[0,0,1]="\"(s|S)iapa (a|A)uthor (anda|kamu|ente|you|your|lu)$\""
	[0,0,2]="\"pejuang kentang\" \"pejuang kentang channel termux yg berfaedah\""
)
msg3=(
	[0,0,1]="\"seberapa (ganteng|cakep).*$\""
	[0,0,2]="\"$(Games.ganteng)\" \"$(Games.ganteng)\" \"b aja masi gantengan admin pejuang kentang :v\""
)
msg4=(
	[0,0,1]="\"(bot|woi|p|oi|woi bot|p bot|oi bot) (cakepan|gantengan) (antum|saya|me|gua|gue|w) (atau|apa)[[:space:]][a-z]*$\""
	[0,0,2]="\"$(Games.seberapa.ganteng)\" \"Gantengan Author Bot nya :v\""
)
msg5=(
	[0,0,1]="\"[A-Za-z]* bumi (itu datar|bentuk (atau|apa) bulat$\" \"bumi itu datar (atau|apa) bulat$\""
	[0,0,2]="\"datar\" \"bulat\""
)
msg6=(
	[0,0,1]="\"berapa [0-9]* (-|\*|\/|\+|\%|x|\:) [0-9]*$\" \"mtk : .*$\" \"mtk .*$\""
	[0,0,2]="\"$(mtk)\""
)
msg7=(
	[0,0,1]="\"batu gunting kertas.*$\" \"batu-gunting-kertas.*$\""
	[0,0,2]="\"$(Games.batu.gunting)\" \"$(Games.batu.gunting)\""
)
msg8=(
	[0,0,1]="\"anjay$\" \"anjaz$\" \"gg$\" \"keren$\""
	[0,0,2]="\"yoi\" \"haha\" \"hayuk\" \"[Layla] OK\""
)
msg9=(
	[0,0,1]="\"haha*$\" \"awokawok*$\" \"wkwk*\" \"ngik.*$\" \"lawak*$\""
	[0,0,2]="\"wkkwwkwkwk\" \"hahaha\" \"awokawok\""
)
msg10=(
	[0,0,1]="\"napa ketawa.*$\" \"kenapa ketawa.*$\" \"ngapain ketawa.*$\""
	[0,0,2]="\"gpp\" \"lucu\" \"gak tau\""
)
msg11=(
	[0,0,1]="\"([A-Za-z]*[[:space:]]|^)sekarang tanggal berapa.*$\" \"([A-Za-z]*[[:space:]]|^)sekarang tahun berapa.*$\" \"([a-z]*[[:space:]]|^)sekarang bulan berapa.*$\""
	[0,0,2]="\"sekarang $(Fungsi.App.Date)\" \"sekarang tanggal jadian saya dengan kamu :v\""
)
msg12=(
	[0,0,1]="\"([A-Za-z]*[[:space:]]|^)sekarang jam berapa.*$\" \"([A-Za-z]*[[:space:]]|.)jam berapa sekarang.*$\""
	[0,0,2]="\"sekarang jam $(Fungsi.App.time)\" \"sekarang waktu saat kita bertemu :v\""
)
msg13=(
	[0,0,1]="\"([a-zA-Z]*[[:space:]]|^)tunjukan data (sekarang|terkini|saat ini)$\" \"([a-zA-Z]*[[:space:]]|^)tunjukan data waktu (sekarang|saat ini|terkini)$\" \"([A-Za-z]*[[:space:]]|^)waktu sekarang$\" \"[A-Za-z]nformasi (t|T)erkini$\""
	[0,0,2]="\"$(Fungsi.App.now)\""
)
msg14=(
	[0,0,1]="\"(bagaimana|gimana) kabarmu.*$\""
	[0,0,2]="\"baik\" \"baik bagaimana kabarmu juga\" \"baik kok\""
)
msg15=(
	[0,0,1]="\"kabarku baik$\" \"kabar aku juga baik$\" \"kabarku saat ini baik$\""
	[0,0,2]="\"syukurlah jaga kesehatan anda\" \"baguslah kalo begitu\" \"bagus jangan lupa jaga kesehatan\""
)
msg16=(
	[0,0,1]="\"(ok bot$|ok[[:space:]].*$)\" \"yoi.*$\" \"ya[[:space:]].*$\" \"baguslah.*$\""
	[0,0,2]="\"[Layla] Ok\" \"yoi bang\""
)
msg17=(
	[0,0,1]="\"[A-Za-z]* bot$\" \"p$\" \"oi$\" \"woi$\" \"(cuks|cuk|cug|meg|megs|ngab|cuaks)$\""
	[0,0,2]="\"ya ada apa\" \"ya\" \"apa ?\" \"kenapa ?\""
)
msg18=(
	[0,0,1]="\"(s|S)earch[[:space:]].*$\""
	[0,0,2]="\"$(Fungsi.App.search)\""
)
msg19=(
	[0,0,1]="\"menu (bot|ai|saat ini|script)$\" \"menu$\""
	[0,0,2]="\"$(MainMenu)\""
)
