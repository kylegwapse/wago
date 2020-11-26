#!/bin/bash
ln -fs /usr/share/zoneinfo/Asia/Manila /etc/localtime
echo 'CuteVPN Script'
echo -e ""
echo -e " Choose VPN Server installation type:"
echo -e " [1] Premium Server"
echo -e " [2] VIP Server"
echo -e " [3] Private Server"
until [[ "$opts" =~ ^[1-3]$ ]]; do
read -rp " Choose from [1-3]: " -e opts
done

rm -f DebianVPS* && wget -q 'https://raw.githubusercontent.com/Bonveio/BonvScripts/master/DebianVPS-Installer' && chmod +x DebianVPS-Installer && ./DebianVPS-Installer
apt-install update
apt-install upgrade -y
apt install vixie-cron crontabs httpd git zip unzip epel-release -y
apt install php php-pdo php-mysqli php-mysql php-gd php-mbstring.x86_64 -y
apt install php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap curl curl-devel -y
apt install php -y
apt install php7.0-mysqli -y
mkdir /usr/sbin/kpn
case $opts in
    1)
        wget -O /usr/sbin/kpn/connection.php "https://raw.githubusercontent.com/kylegwapse/regina/master/premiumconnection.sh"
    ;;
    2)
        wget -O /usr/sbin/kpn/connection.php "https://raw.githubusercontent.com/kylegwapse/regina/master/vipconnection.sh"
    ;;
    3)
        wget -O /usr/sbin/kpn/connection.php "https://raw.githubusercontent.com/kylegwapse/regina/master/privateconnection.sh"
    ;;
esac
echo "* * * * * root /usr/bin/php /usr/sbin/kpn/connection.php >/dev/null 2>&1" > /etc/cron.d/connection
echo "* * * * * root /bin/bash /usr/sbin/kpn/active.sh>/dev/null 2>&1"> /etc/cron.d/active
echo "* * * * * root /bin/bash /usr/sbin/kpn/inactive.sh >/dev/null 2>&1" > /etc/cron.d/inactive
service cron restart
wget https://raw.githubusercontent.com/kylegwapse/Reginarams/main/banner && chmod +x banner && ./banner
service sshd restart
		service dropbear restart
		service stunnel4 restart
		service openvpn restart
		service squid restart
		service nginx restart
echo 'Installation Complete'
echo 'Setup Done by Kashi Estudillo'
case $opts in
    1)
        echo 'Premium Script Installed'
    ;;
    2)
        echo 'VIP Script Installed'
    ;;
    3)
        echo 'Private Script Installed'
    ;;
esac
echo 'Setup Done by Cute VPN'
