echo "* * * * * root /bin/bash /etc/ohpserver/stop 2>/dev/null" > /etc/cron.d/recon
echo "* * * * * root /bin/bash /etc/ohpserver/run 2>/dev/null" > /etc/cron.d/recon
service cron restart
echo 'Server-side Auto Recon Complete'
echo 'Setup Done by Kashi Estudillo'

