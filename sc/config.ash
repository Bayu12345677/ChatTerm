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
			"gunting [aduh kalah gua]"
			"batu [sama bang]"
			"kertas [mudah kali]"
			"gunting [dahlah]"
		)

		local arrayGunting=(
			"batu [yahaha so easy]"
			"gunting [seri]"
			"kertas [ampun suhu]"
			"batu [mudah banget]"
			"gunting [yah seri]"
			"kertas [:(]"
		)

		local arrayKertas=(
			"batu [yah kalah gua]"
			"gunting [ez cuy]"
			"kertas [seri kita]"
			"batu [citer lu]"
			"gunting [ez banget]"
			"kertas [yaelah seri]"
		)

		if test "${match}" == "[batu]"; then
			
	}
	
	eval __init__
}

function mtk(){
	# ask : berapa
	local myinput="$input"

	# data pertanyaan
	function f1(){ dinput=$(grep -Po '(tambah|\+|jumlah|bagi|\/|kali|\*|kurang|-|modules|\%)' <<< "$myinput"); }
	function f2(){ soal1=$(grep -Po '[0-9]*' <<< "$myinput"|tail +1|head -1); }
	function f3(){ soal2=$(grep -Po '[0-9]*' <<< "$myinput"|tail +2|head -1); }

	if grep -o "mtk*" <<< "$myinput" &>/dev/null; then
		# mencari nilai inti
		local datacore=$(tr -d ":" <<< "$myinput"|sed 's/[[:space:]]//')
		local core_value=$(grep -Po '(?<=[[:space:]])[^}.]*' <<< "$datacore")
		local value=$(echo "$core_value")

		eval "echo \$(($value))" 2>/dev/null
	fi

	{ f1; f2; f3; }
	# penentuan data operator
	if { test "$dinput" == "tambah"; } || { test "$dinput" == "+"; } || { test "$dinput" == "jumlah"; }
	then
		cat <<< "$((soal1 + soal2))"
	elif { test "$dinput" == "kurang"; } || { test "$dinput" == "-"; }
	then
		cat <<< "$((soal1 - soal2))"
	elif { test "$dinput" == "bagi"; } || { test "$dinput" == "/"; }
	then
		cat <<< "$((soal1 / soal2))"
	elif { test "$dinput" == "kali"; } || { test "$dinput" == "*"; }
	then
		cat <<< "$((soal1 * soal2))"
	elif { test "$dinput" == "modules"; } || { test "$dinput" == "%"; }
	then
		cat <<< "$((soal1 % soal2))" || { cat <<< "[!] Operator dan value tidak valid"; }
	else eval "$myinput" 2>/dev/null || true
	fi
}

eval GAMES

#tempat konektor
msg1=(
	[0,0,1]="\"halo$\" \"halo bot$\""
	[0,0,2]="\"halo juga\" \"halo\""
)
msg2=(
	[0,0,1]="\"siapa author (anda|kamu|ente|you|your)$\""
	[0,0,2]="\"pejuang kentang\""
)
msg3=(
	[0,0,1]="\"seberapa (ganteng|cakep) ((gua|gue)[[:space:]](bot|bro|bre|oi|cuk|cok|cuaks|chuaks|su|meg|meks|megs)|[a-z]*)$\""
	[0,0,2]="\"$(Games.ganteng)\" \"$(Games.ganteng)\""
)
msg4=(
	[0,0,1]="\"(bot|woi|p|oi|woi bot|p bot|oi bot) (cakepan|gantengan) (antum|saya|me|gua|gue|w) (atau|apa)[[:space:]][a-z]*$\""
	[0,0,2]="\"$(Games.seberapa.ganteng)\""
)
msg5=(
	[0,0,1]="\"[a-z]* bumi (itu datar|bentuk (atau|apa) bulat$\" \"bumi itu datar (atau|apa) bulat$\""
	[0,0,2]="\"datar\" \"bulat\""
)
msg6=(
	[0,0,1]="\"berapa [0-9]* (-|\*|\/|\+|\%) [0-9]*$\" \"mtk : .*$\" \"mtk .*$\""
	[0,0,2]="\"$(mtk)\""
)
msg7=(
	[0,0,1]="\"batu gunting kertas.*$\" \"batu-gunting-kertas.*$\""
	[0,0,2]=""
)
