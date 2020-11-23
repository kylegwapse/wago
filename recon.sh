echo "* * * * * root/bin/bash /etc/ohpserver/stop >/dev/null 2>&1" > /etc/cron.d/recon
echo "* * * * * root/bin/bash /etc/ohpserver/run >/dev/null 2>&1" > /etc/cron.d/recon
service cron restart
echo 'Server-side Auto Recon Complete'
echo 'Setup Done by Kashi Estudillo'

