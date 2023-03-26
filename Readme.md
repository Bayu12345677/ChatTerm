<h2 align="center">Bot Chat MD</h2>
<p align="center">
  <img src="https://img.shields.io/static/v1?label=language&message=Bourne+Again+Shell&color=green&logo=nano">
  <img src="https://img.shields.io/static/v1?label=Framework&message=Bash+ID&color=green&logo=reddit"><br>
  <img src="https://img.shields.io/github/forks/Bayu12345677/ChatTerm?logo=git&style=social">
  <img src="https://img.shields.io/github/license/Bayu12345677/ChatTerm?color=green&logo=apache&style=flat-square">
</p>

<br>

Simple Chat Bot with smart Ai supported by regexp in every one of his dictionaries Built Using Bash Script

### `How to use in your script`

```bash
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
```

<p>Fungsi:</p>
<p align="center">
  <li>Bot</li>
    <div>: fungsi Bot merupakan oop dari Bot Chat</div>
  <li>Bot.config "#path" "#variabel input"</li>
    <div>: Bot.config berfungsi untuk menerima input dan mengimport kosa kata</div>
  <li>Bot.App.run</li>
    <div>: berfungsi untuk mengirimkan data dari config ke Ai serta menjalankan bot</div><br>
</p>

- bagaimana cara mengedit config nya?<br>
  : anda bisa mengedit config pada directory sc dengan menggunakan text editor seperti nano atau lain nya, dan untuk syntax config nya menggunakan syntax bash pada umum nya
  untuk dictionary nya menggunakan array dengan nama msg#angka urut dan index [0,0,1] = sebagai input, [0,0,2] = sebagai output, dan input variabel user bisa di panggil di script misal nya seperti kolom di bawah ini
  <br>
# simple config.sh
```bash
#!usr/bin/bash

# semisal saya mengeksekusi bot dengan nama variabel input, read -p "input : " input
# jadi sesuaikan nama variabel dengan input pengguna jika ingin membuat fitur seperti di bawah ini

# ini merupakan fungsi
function random_number(){
  local get_arg=$(grep -o '[0-9]' <<< "$input")
  local newarray=(${get_arg})
  local getsize=$(sed 's/[[:space:]]/\n/g' <<< "${!newarray[@]}"|sort -nr|head -1)

  shuf -i 0-${getsize} -n 1
}

# ini merupakan konektor / database bot
msg1=([0,0,1]="\"halo [a-z0-9]*$\" \"hai [a-z0-9]*$\"" [0,0,2]="\"hai juga\" \"halo juga\"")
msg2=([0,0,1]="\"tolong berikan saya angka (acak|random) [a-z0-9]*$\"" [0,0,2]="\"$(random_number)\"")
```

> requirement : apt install jq curl html2text
<br>
<br>
<code><p align="center">berhasil di termux</p></code>
