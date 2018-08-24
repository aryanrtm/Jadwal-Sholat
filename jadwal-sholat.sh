#!/bin/bash

# Jadwal Sholat CLI Version by 4WSec (Arya Narotama)
# Anon Cyber Team

# color
cyan='\e[0;36m'
green='\e[0;34m'
yellow='\e[1;33m'
red='\e[1;31m'
white='\e[1;37m'

# user agent
useragent="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0"

# getAPI
ambil(){
	curl -s -A "${useragent}" "https://time.siswadi.com/pray/${kota}" >> result.lst
	if [[ $(cat result.lst) =~ "invalid address g88" ]]; then
		echo "[!] Kota Salah ..."
	else
		LozShubuh=$(cat result.lst | grep -Po '(?<="Fajr": ").*?(?=")')
		LozDzuhur=$(cat result.lst | grep -Po '(?<="Dhuhr": ").*?(?=")')
		LozAshar=$(cat result.lst | grep -Po '(?<="Fajr": ").*?(?=")')
		LozMaghrib=$(cat result.lst | grep -Po '(?<="Maghrib": ").*?(?=")')
		LozIsya=$(cat result.lst | grep -Po '(?<="Isha": ").*?(?=")')
		Lozstm=$(cat result.lst | grep -Po '(?<="SepertigaMalam": ").*?(?=")')
		Loztm=$(cat result.lst | grep -Po '(?<="TengahMalam": ").*?(?=")')
		Lozdtm=$(cat result.lst | grep -Po '(?<="DuapertigaMalam": ").*?(?=")')

		echo -e $green"Tanggal  : $red`date`"
		echo -e $green"Kota     : $red$kota"
		echo -e $white"======================================================"
		echo -e $cyan"Shubuh   : $red$LozShubuh              $cyan Magrib           : $red$LozMaghrib"
		echo -e $cyan"Dzuhur   : $red$LozDzuhur              $cyan Sepertiga Malam  : $red$Lozstm"
		echo -e $cyan"Ashar    : $red$LozAshar              $cyan Duapertiga Malam : $red$Lozdtm"
		echo -e $cyan"Isya     : $red$LozIsya"
		
	fi
}

# banner
banner(){
echo -e $yellow"                                                                _    "
echo -e $yellow"                                                               ( ) "
echo -e $green" _ ____ ___  _ _ _ ____ _       ____ _  _ ____ _    ____ ___  $yellow(   ) "
echo -e $green" | |__| |  \ | | | |__| |       [__  |__| |  | |    |__|  |    $yellow| | "
echo -e $green"_| |  | |__/ |_|_| |  | |___    ___] |  | |__| |___ |  |  |    $yellow| | "
echo -e $yellow"                                                             (TTTTT) "
echo -e $green"                                      Made with $red<3$green by 4WSec"
echo ""
}

clear
read -p "Nama Kota: " kota;
clear
banner
ambil
rm -f result.lst
