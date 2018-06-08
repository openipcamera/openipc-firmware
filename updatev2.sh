#update via scp
DIR=`pwd`
scp -r $DIR/firmware_mod/v2/  root@$1:/system/sdcard/
#echo "Rebooting camera"
#curl http://$1/cgi-bin/action?cmd=reboot
