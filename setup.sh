#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
Blink='\e[5m'
yell='\e[33m'
lgreen='\e[92m'
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);

clear
if [ -f "/etc/v2ray/domain"]; then
echo "Script Already Installed"
exit 0
fi
clear
echo ""
echo ""
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \E[0;100;33m        • AutoScript by candrastore •       \E[0m"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green              Proses akan mulai dalam 3 detik!            $NC"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 3
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green Silahkan masukan sub domain anda $NC"
echo -e "$green Jika tidak punya silahkan klik [ Ctrl+C ] • To-Exit $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p " Hostname / Domain: " host
mkdir -p /etc/
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/tls
mkdir -p /etc/config-url
mkdir -p /etc/config-user
mkdir -p /etc/xray/conf
mkdir -p /etc/v2ray/conf
mkdir -p /etc/systemd/system/
mkdir -p /var/log/xray/
mkdir -p /var/log/v2ray/
mkdir /var/lib/premium-script;
touch /etc/xray/clients.txt
touch /etc/v2ray/clients.txt
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" > /etc/v2ray/domain
echo "$host" > /root/domain

clear
secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green     Tunggu sebentar $NC"
echo -e "$gree Process Update & Upgrade Sedang Dijalankan  $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
apt-get update && apt-get upgrade -y && update-grub -y
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green  Process Update&Upgrade Selesai        $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green Installing AutoScript EndkaVPN        $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
#install ssh ovpn
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install SSH OVPN               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/cdr23/s/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
#install ssr
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install SSR                $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/cdr23/s/main/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://raw.githubusercontent.com/cdr23/s/main/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
#install wireguard
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green        Install Wireguard              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/cdr23/s/main/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
#install v2ray
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green  ISSUE CERT & Install TROJAN GFW       $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/cdr23/s/main/inss-vt.sh && chmod +x inss-vt.sh && screen -S v2ray ./inss-vt.sh
#Instal Xray
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install XRAY              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/cdr23/s/main/xray.sh && chmod +x xray.sh && screen -S xray ./xray.sh
#set backup
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green            SET BACKUP               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/cdr23/s/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh

rm -f /root/ssh-vpn.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/wg.sh
rm -f /root/inss-vt.sh
rm -f /root/set-br.sh
rm -f /root/xray.sh

echo '#!/bin/bash' > /usr/local/bin/reboot_otomatis 
echo 'tanggal=$(date +"%m-%d-%Y")' >> /usr/local/bin/reboot_otomatis 
echo 'waktu=$(date +"%T")' >> /usr/local/bin/reboot_otomatis
echo 'clear-log && xp' >> /usr/local/bin/reboot-otomatis
echo 'echo "Server Berhasil Reboot Pada Tanggal $tanggal Dan Jam $waktu." >> /root/log-reboot.txt' >> /usr/local/bin/reboot_otomatis 
echo '/sbin/shutdown -r now' >> /usr/local/bin/reboot_otomatis 
chmod +x /usr/local/bin/reboot_otomatis
echo "0 0 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis

echo "0 */6 * * *  root clear-log && ban" >>/etc/cron.d/banned

wget -O /usr/bin/addssh https://raw.githubusercontent.com/cdr23/s/main/adds.sh && chmod +x /usr/bin/addssh
wget -O /usr/bin/addxr https://raw.githubusercontent.com/cdr23/s/main/addxr.sh && chmod +x /usr/bin/addxr
wget -O /usr/bin/addtrg https://raw.githubusercontent.com/cdr23/s/main/trjg.sh && chmod +x /usr/bin/addtrg

chmod +x /usr/bin/addssh
chmod +x /usr/bin/addxr
chmod +x /usr/bin/addtrg

#PORT=$((RANDOM + 10000))
domain=$(cat /etc/v2ray/domain)
uid=$(cat /etc/trojan/uuid.txt)
cat>/usr/local/etc/xray/trojanws.json<<EOF
{
  "log": {
    "access": "/var/log/xray/trojanws.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
  },
  "inbounds": [
    {
      "port": 32181,
      "protocol": "trojan",
      "settings": {
        "clients": [
          {
            "id": "$uid"
#tls
          }
        ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": {
          "path": "/WorldSSH",
          "headers": {
            "Host": ""
          }
         },
        "quicSettings": {},
        "sockopt": {
          "mark": 0,
          "tcpFastOpen": true
        }
      },
      "sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
        ]
      },
      "domain": "$domain"
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    },
    {
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    }
  ],
  "routing": {
    "rules": [
      {
        "type": "field",
        "ip": [
          "0.0.0.0/8",
          "10.0.0.0/8",
          "100.64.0.0/10",
          "169.254.0.0/16",
          "172.16.0.0/12",
          "192.0.0.0/24",
          "192.0.2.0/24",
          "192.168.0.0/16",
          "198.18.0.0/15",
          "198.51.100.0/24",
          "203.0.113.0/24",
          "::1/128",
          "fc00::/7",
          "fe80::/10"
        ],
        "outboundTag": "blocked"
      },
      {
        "type": "field",
        "outboundTag": "blocked",
        "protocol": [
          "bittorrent"
        ]
      }
    ]
  }
}
EOF
systemctl start xray@trojanws
systemctl enable xray@trojanws
systemctl restart xray@trojanws

cat > /usr/bin/bersih << END
#!/bin/bash
echo 1 > /proc/sys/vm/drop_caches
echo 2 > /proc/sys/vm/drop_caches
echo 3 > /proc/sys/vm/drop_caches
swapoff -a
swapon -a
ban
clear-log
END
chmod +x /usr/bin/bersih


rm -f /root/inss-vt.sh
rm -f /root/set-br.sh
rm -f /root/xray.sh

echo "*/5 0 * * * root echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a && ban" > /etc/cron.d/cache_ban
systemctl restart cron

cd /usr/bin
wget -O ban "https://raw.githubusercontent.com/Afdhan/sce/main/kill.sh"
chmod +x ban
cd

cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://worldssh.tech

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://raw.githubusercontent.com/cdr23/s/main/set.sh"
chmod +x /etc/set.sh
history -c
clear
rm -f /root/*.sh
echo " "
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green  Installation has been completed!!      $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
echo " "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \E[0;100;33m        • AutoScript by Candrastore •       \E[0m"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200"  | tee -a log-install.txt
echo "   - Stunnel4                : 222, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8000 (limit to IP SSH)"  | tee -a log-install.txt
echo "   - OHP SSH                 : 8181"  | tee -a log-install.txt
echo "   - OHP Dropbear            : 8282"  | tee -a log-install.txt
echo "   - OHP OVPN                : 8383"  | tee -a log-install.txt
echo "   - Badvpn                  : 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81, 80"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - XRAY VMESS XTLS SPLICE  : 443"  | tee -a log-install.txt
echo "   - XRAY VMESS XTLS DIRECT  : 443"  | tee -a log-install.txt
echo "   - XRAY VMESS WS TLS       : 443"  | tee -a log-install.txt
echo "   - XRAY VLESS XTLS SPLICE  : 443"  | tee -a log-install.txt
echo "   - XRAY VLESS XTLS DIRECT  : 443"  | tee -a log-install.txt
echo "   - XRAY VLESS WS TLS       : 443"  | tee -a log-install.txt
echo "   - XRAY TROJAN TLS         : 443"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                 : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                 : [ON]"  | tee -a log-install.txt
echo "   - DDOS Dflate              : [ON]"  | tee -a log-install.txt
echo "   - IPtables                 : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot              : [OFF]" | tee -a log-install.txt
echo "   - IPv6                     : [OFF]" | tee -a log-install.txt
echo "   - Auto-Remove-Expired      : [ON]"  | tee -a log-install.txt
echo ""
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
echo -e ""
sleep 3
echo -e ""

rm -f /root/setup.sh
rm -f /root/.bash_history
echo -ne "[ ${yell}WARNING${NC} ] Reboot vps? (y/n)? "
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
exit 0
else
reboot
fi

