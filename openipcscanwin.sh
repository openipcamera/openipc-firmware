#! /bin/bash

TIME=30

#begin endless loop
while true;do

	#set screen size variables from arguments
	x=$1
	y=$2
	x2=x/2
	y2=y/2

	#scan local network for rtsp cameras
	echo "Searching for OpenIP/Fanghacks cameras:"
	nmap -p80 192.168.1.0/24 -oG - | awk '/open/ {print $2}' > ~/camlist.txt
	
        camera=0
        while IFS=, read ipaddress;do

	echo $ipaddress >> ~/openipclist.txt
	curl --max-time 3 -Is $ipaddress/cgi-bin/status | head -n1 >> ~/openipclist.txt
	done < ~/camlist.txt

	sed -i 's/200 OK/OpenIP Camera Found!/g' ~/openipclist.txt

	cat ~/openipclist.txt | grep -B 1 "Open"

	#determine number of cameras by reading camlist.txt
	cameras=0
	while IFS=, read cam;do
		((cameras = cameras + 1))
	done < ~/camlist.txt

COUNT=`wc -l ~/camlist.txt`
echo "Manage camera from http://ipaddress/cgi-bin/status"
echo "Restarting search in $TIME"

	camera=0
	while IFS=, read ipaddress;do
		((camera = camera + 1))
		a=0
		b=0
		c=0
		d=0
		if  [ "$camera" -eq "1" ]; then
			((c=x2))
			((d=y2))
			if [ "$cameras" -eq "1" ]; then
				((c=x))
				((d=y))
			fi
		fi
		if [ "$camera" -eq "2" ]; then
			((a=x2))
			((c=x))
			((d=y2))
		fi
		if [ "$camera" -eq "3" ]; then
			((b=y2))
			((c=x2))
			((d=y))
		fi
		if [ "$camera" -eq "4" ]; then
			((a=x2))
			((b=y2))
			((c=x))
			((d=y))
		fi
	done < ~/camlist.txt

	#repeat every 4 hours in case DHCP server gives cameras new IP addresses
	sleep $TIME
rm ~/openipclist.txt
done
