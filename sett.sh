#!/bin/bash
lagi='y'
while [ $lagi == 'y' ] || [ $lagi == 'Y' ];
do
clear
echo -e "+++++++++++++++++++++++++++++++++++++++++++";
echo -e "\033[1;31m LOSS GAK REWEL TETAP SEMANGAT\033[0m";
echo -e "\033[1;35m =====Selamat Menambang=======\033[0m";
echo -e "\033[1;37m =======Idena Sidoarjo========\033[0m";
echo -e "+++++++++++++++++++++++++++++++++++++++++++";
echo -e "\033[1;33m Minimal Spek VPS 4GB RAM untuk Satu Node\033[0m"
echo -e "   1.\033[1;36mInstall idena manager\033[0m";
echo -e "   2.\033[1;36mOnline Kan Status Mining\033[0m";
echo -e "   3.\033[1;36mOffline Kan Status Mining\033[0m";
echo -e "   4.\033[1;36mPerbaiki Error/update Idenachain.db pada idena manager\033[0m";
echo -e "   5.\033[1;36mUpdate Node Manual Idena Manager\033[0m";
echo -e "   6.\033[1;36mInstall Node Share\033[0m";
echo -e "   7.\033[1;36mCek Status Node Share\033[0m";
echo -e "   8.\033[1;36mEdit/Tambah/Hapus Apikey pada Node Share\033[0m";
echo -e "   9.\033[1;36mUpdate Node Share\033[0m"
echo -e "  10.\033[1;36mMatikan nodeshare\033[0m"
echo -e "  11.\033[1;36mHidupkan nodeshare\033[0m"
echo -e "  12.\033[1;36mExit/metu/beres kabeh\033[0m";
echo -e "+++++++++++++++++++++++++++++++++++++++++++";
read -p "pilih ketik nomor ======= ENTER ====>>> [1-12]: " pil;
echo -e "===========================================";
case $pil in
1)
	sudo fallocate -l 1G /swapfile2 && sudo chmod 600 /swapfile2 && sudo mkswap /swapfile2 && sudo swapon /swapfile2 && echo -e '/swapfile2 none swap sw 0 0' | sudo tee -a /etc/fstab
	source <(curl -sL https://bit.ly/idena-manager-installer)
	sudo ufw allow 9009/tcp
	echo -e "\033[1;33m Instalasi Idena Manager sudah selesai\033[0m"
	echo -e "\033[1;32m untuk Menambahkan node silahkan Gunakan perintah=\033[0m \033[1;35m idena-manager add -w ISI_NODEKEY_KAMU -k ISI_APIKEY_KAMU\033[0m"
	echo -e "\033[1;32m Jika nodekey dan apikey di kosongkan maka secara otomatis akan generate code baru\033[0m"
	echo -n "Kembali ke Menu Idena Asisten (Y) atau Keluar(N)?"
	read lagi;
	while [ $lagi != 'y' ] && [ $lagi != 'Y' ] && [ $lagi != 'n' ] && [ $lagi != 'N' ];
	do
	echo -e "Maaf, input yang anda masukkan salah";
	echo -e -n "Kembali ke Menu Idena Asisten (Y) atau Keluar(N)? ";
	read lagi;
	done
;;
2)
	cd datadir-node1
	apikey=$(<"api.key")
	cd ..	
	curl 'http://127.0.0.1:9009/' -H 'Content-Type: application/json' --data '{"method":"dna_becomeOnline","params":[{}],"id":1,"key": '$apikey'}'
	echo -e "\033[1;32m Status Mining sudah Di aktifkan\033[0m"
	echo -n "Kembali ke Menu Idena Asisten (Y) atau Keluar(N)?"
	read lagi;
	while [ $lagi != 'y' ] && [ $lagi != 'Y' ] && [ $lagi != 'n' ] && [ $lagi != 'N' ];
	do
	echo -e "Maaf, input yang anda masukkan salah";
	echo -n "Kembali ke Menu Idena Asisten (Y) atau Keluar(N)? ";
	read lagi;
	done
;;
3)
	set echo on
	cd datadir-node1
	apikey=$(<"api.key")
	cd ..
	curl 'http://127.0.0.1:9009/' -H 'Content-Type: application/json' --data '{"method":"dna_becomeOffline","params":[{}],"id":1,"key": '$apikey'}'
	echo -e "\033[1;32m Status Mining sudah Di nonaktfikan\033[0m"
	echo -n "Kembali ke Menu Idena Asisten (Y) atau Keluar(N)?"
	read lagi;
	while [ $lagi != 'y' ] && [ $lagi != 'Y' ] && [ $lagi != 'n' ] && [ $lagi != 'N' ];
	do
	echo -e "Maaf, input yang anda masukkan salah";
	echo -n "Kembali ke Menu Idena Asisten (Y) atau Keluar(N)? ";
	read lagi;
	done
;;
4)
	set echo on
	idena-manager disable
	cd datadir-node1
	rm -r idenachain.db
	mkdir idenachain.db
	cd idenachain.db
	sudo apt-get install unzip
	wget "https://sync.idena-ar.com/idenachain.db.zip"
	unzip idenachain.db.zip
	rm idenachain.db.zip
	cd ..
	cd ..
	idena-manager enable
	idena-manager status
	echo -e "\033[1;32m idenachain.db sudah selesai diperbaiki atau diupdate\033[0m"
	echo -e -n "Kembali ke Menu Idena Asisten (Y) atau Selesai(N)?"
	read lagi;
	while [ $lagi != 'y' ] && [ $lagi != 'Y' ] && [ $lagi != 'n' ] && [ $lagi != 'N' ];
	do
	echo -e "Maaf, input yang anda masukkan salah";
	echo -n "Kembali ke Menu Idena Asisten (Y) atau Selesai(N)? ";
	read lagi;
	done
;;
5)
	set echo on
	idena-manager disable
	rm idena-node-linux-latest
	curl -s https://api.github.com/repos/idena-network/idena-go/releases/latest | grep browser_download_url | grep idena-node-linux-0.* | cut -d '"' -f 4 | wget -qi -
	mv idena-node-linux-* idena-node-linux-latest
	chmod +x idena-node-linux-latest
	idena-manager enable
	echo -e "\033[1;32m node sudah selesai di update\033[0m"
	echo -e -n "Kembali ke Menu Idena Asisten (Y) atau Selesai(N)?"
	read lagi;
	while [ $lagi != 'y' ] && [ $lagi != 'Y' ] && [ $lagi != 'n' ] && [ $lagi != 'N' ];
	do
	echo -e "Maaf, input yang anda masukkan salah";
	echo -e -n "Kembali ke Menu Idena Asisten (Y) atau Selesai(N)? ";
	read lagi;
	done	
;;
6)
	set echo on
	apt-get update && apt-get upgrade -y
	apt-get install git npm unzip curl screen -y
	npm i npm@latest -g
	bash -c 'echo -e "{\"IpfsConf\":{\"Profile\": \"server\" ,\"FlipPinThreshold\":1},\"Sync\": {\"LoadAllFlips\": true}}" > configshare.json'
	idena-manager disable
	screen -dmS idena-node ./idena-node-linux-latest --config=configshare.json --datadir=datadir-node1
	git clone https://github.com/idena-network/idena-node-proxy
	npm i -g pm2
	sudo ufw allow 80/tcp
	cd datadir-node1
	apikey=$(<"api.key")
	cd ..
	cd idena-node-proxy
	bash -c 'echo -e "AVAILABLE_KEYS=[\"api1\",\"api2\"]
IDENA_URL=\"http://localhost:9009\"
IDENA_KEY=\"'$apikey'\"
PORT=80" > .env'
	npm install
	npm start
	echo -e "\033[1;32m nodeshare Sudah Selesai di Instal dan dijalankan\033[0m"
	echo -e "\033[1;32m untuk melihat status nodeshare silahkan Kembali ke menu dan pilih 7\033[0m"
	echo -e -n "Kembali ke Menu Idena Asisten (Y) atau Selesai(N)?"
	read lagi;
	while [ $lagi != 'y' ] && [ $lagi != 'Y' ] && [ $lagi != 'n' ] && [ $lagi != 'N' ];
	do
	echo -e "Maaf, input yang anda masukkan salah";
	echo -e -n "Kembali ke Menu Idena Asisten (Y) atau Selesai(N)? ";
	read lagi;
	done
;;
7)
	pm2 ls
	echo -n "Kembali ke Menu Idena Asisten (Y) atau Selesai(N)?"
	read lagi;
	while [ $lagi != 'y' ] && [ $lagi != 'Y' ] && [ $lagi != 'n' ] && [ $lagi != 'N' ];
	do
	echo -e "Maaf, input yang anda masukkan salah";
	echo -n "Kembali ke Menu Idena Asisten (Y) atau Selesai(N)? ";
	read lagi;
	done
;;
8)
	echo -e "\033[1;32m Silahkan ubah pada bagian AVAILABLE_KEYS sesuai formatnya\033[0m"
	echo -e "\033[1;32m jika sudah selesai tekan Ctrl+X kemudian Y untuk menyimpan kemudian enter\033[0m"
	echo -e "\033[1;32m setelah di simpan jangan lupa update nodeshare di menu idena Asisten\033[0m"
	read -p "Tekan Enter untuk melanjutkan proses"
	nano idena-node-proxy/.env
	echo -e -n "Kembali ke Menu Idena Asisten (Y) atau Selesai(N)?"
	read lagi;
	while [ $lagi != 'y' ] && [ $lagi != 'Y' ] && [ $lagi != 'n' ] && [ $lagi != 'N' ];
	do
	echo -e "Maaf, input yang anda masukkan salah";
	echo -e -n "Kembali ke Menu Idena Asisten (Y) atau Selesai(N)? ";
	read lagi;
	done
;;
9)
	pm2 start idena-node-proxy --update-env
	echo -e "\033[1;32m nodeshare selesai di update\033[0m"
	echo -n "Kembali ke Menu Idena Asisten (Y) atau Selesai(N)?"
	read lagi;
	while [ $lagi != 'y' ] && [ $lagi != 'Y' ] && [ $lagi != 'n' ] && [ $lagi != 'N' ];
	do
	echo -e "Maaf, input yang anda masukkan salah";
	echo -n "Kembali ke Menu Idena Asisten (Y) atau Selesai(N)? ";
	read lagi;
	done
;;
10)
	pm2 delete idena-node-proxy
	idena-manager enable
	echo -e "\033[1;32m nodeshare telah di nonaktfikan\033[0m"
	echo -n "Kembali ke Menu Idena Asisten (Y) atau Selesai(N)?"
	read lagi;
	while [ $lagi != 'y' ] && [ $lagi != 'Y' ] && [ $lagi != 'n' ] && [ $lagi != 'N' ];
	do
	echo -e "Maaf, input yang anda masukkan salah";
	echo -n "Kembali ke Menu Idena Asisten (Y) atau Selesai(N)? ";
	read lagi;
	done
;;
11)
	idena-manager disable
	cd idena-node-proxy
	npm start
	cd ..
	echo -e "\033[1;32m nodeshare telah di aktfikan\033[0m"
	echo -n "Kembali ke Menu Idena Asisten (Y) atau Selesai(N)?"
	read lagi;
	while [ $lagi != 'y' ] && [ $lagi != 'Y' ] && [ $lagi != 'n' ] && [ $lagi != 'N' ];
	do
	echo -e "Maaf, input yang anda masukkan salah";
	echo -n "Kembali ke Menu Idena Asisten (Y) atau Selesai(N)? ";
	read lagi;
	done
;;
12)
	echo -e ""
	echo -e "\033[1;32m \033[0m"
	echo -e "\033[1;32m \033[0m"
	echo -e "\033[1;31m +++++++++idena sidoarjo+++++++++\033[0m"
	echo -e "\033[1;37m ++++++++++++iDNA++++++++++++++++  \033[0m"
	exit
;;
*)	echo -e "Maaf, Pilihan Tidak tersedia"
	echo -n "Kembali ke Menu Idena Asisten (Y) atau Selesai(N)?"
	read lagi;
	while [ $lagi != 'y' ] && [ $lagi != 'Y' ] && [ $lagi != 'n' ] && [ $lagi != 'N' ];
	do
	echo -e "Maaf, input yang anda masukkan salah";
	echo -e -n "Kembali ke Menu Idena Asisten (Y) atau Selesai(N)? ";
	read lagi;
	done
esac
echo -e ""
echo -e "\033[1;32m \033[0m"
echo -e "\033[1;32m \033[0m"
echo -e "\033[1;31m +++++++++idena sidoarjo+++++++++\033[0m"
echo -e "\033[1;37m +++++++++++++iDNA+++++++++++++++  \033[0m"
done
