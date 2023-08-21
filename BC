#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
purple='\e[0;35m'
orange='\e[0;33m'
NC='\e[0m'
clear
IP=$(wget -qO- icanhazip.com);
date=$(date +"%Y-%m-%d")
clear
echo " VPS Data Backup By CandraVpnz "
sleep 1
echo ""
echo -e "[ ${green}INFO${NC} ] Please Insert Password To Secure Backup Data ."
echo ""
read -rp "Enter password : " -e InputPass
clear
sleep 1
if [[ -z $InputPass ]]; then
exit 0
fi
echo -e "[ ${green}INFO${NC} ] Processing . . . "
mkdir -p /root/backup
sleep 1
clear
echo " Please Wait VPS Data Backup In Progress . . . "
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /etc/wireguard backup/wireguard
cp /etc/ppp/chap-secrets backup/chap-secrets
cp /etc/ipsec.d/passwd backup/passwd1
cp /etc/shadowsocks-libev/akun.conf backup/ss.conf
cp -r /var/lib/premium-script/ backup/premium-script
cp -r /home/sstp backup/sstp
cp -r /etc/v2ray backup/v2ray
cp -r /usr/local/etc/xray /backup/xray
cp -r /etc/trojan backup/trojan
cp /etc/nginx/conf.d/vps.conf backup/vps.conf
cp -r /usr/local/shadowsocksr/ backup/shadowsocksr
cp -r /home/vps/public_html backup/public_html
cd /root
zip -rP $InputPass $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
clear
echo -e "\033[1;37mVPS Data Backup By CandraVpnz\033[0m
\033[1;37mTelegram : https://t.me/CandraVpnz / @CandraVpnz\033[0m"
echo ""
echo "Please Copy Link Below & Save In Notepad"
echo ""
echo -e "Your VPS IP ( \033[1;37m$IP\033[0m )"
echo ""
echo -e "Your VPS Data Backup Password : \033[1;37m$InputPass\033[0m"
echo ""
echo -e "\033[1;37m$link\033[0m"
echo ""
echo "If you want to restore data, please enter the link above"
rm -rf /root/backup
rm -r /root/$IP-$date.zip
echo ""
