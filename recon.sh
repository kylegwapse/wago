echo "* * * * * root /bin/bash /etc/ohpserver/stop 2>/dev/null" > /etc/cron.d/rc
service cron restart
echo 'Server-side Auto Recon Complete'
echo 'Setup Done by Kashi Estudillo'

