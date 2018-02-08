#! /bin/bash

TIME=30

#begin endless loop
while true;do

	#set screen size variables from arguments
	x=$1
	y=$2
	x2=x/2
	y2=y/2
	goodip=0

	#determine local network number (e.g. 192.168.0.*) to scan for cameras
	while [ "$goodip" -eq "0" ];do
		#wait until non-169* address assigned by DHCP
		printf "\033c" #clear screen
		ip -o addr show | awk '/brd/ {print $6}' | sed 's/255/*/' > ~/nmapin.txt
		echo "Local network:"
		#cat ~/nmapin.txt
		while IFS=, read ipa;do
			echo $ipa
			if [ ${ipa:0:3} != "169" ]
			then
				goodip=1
				break
			else
				echo "Waiting for DHCP server to assign real IP address..."
				sleep 10
			fi
		done < ~/nmapin.txt
	done

	#scan local network for rtsp cameras
	echo "Searching for RTSP cameras:"
	nmap -p554 -iL ~/nmapin.txt -oG - | awk '/open/ {print $2}' > ~/camlist.txt
	cat ~/camlist.txt

	#determine number of cameras by reading camlist.txt
	cameras=0
	while IFS=, read cam;do
		((cameras = cameras + 1))
	done < ~/camlist.txt

COUNT=`wc -l ~/camlist.txt`
echo "Found $COUNT RTSP Streams"
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
done
