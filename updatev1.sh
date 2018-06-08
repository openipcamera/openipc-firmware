#update via scp
DIR=`pwd`
scp -r $DIR/bootstrap  root@$1:/media/mmcblk0p1
scp -r $DIR/data/* root@$1:/media/mmcblk0p2/data/
echo "Rebooting camera"
curl http://$1/cgi-bin/action?cmd=reboot
