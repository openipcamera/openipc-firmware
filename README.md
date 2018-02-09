## OpenIPC Install ##

Support for Wyze and Xiaomi Fang Cams

### Installation Instructions: ###

1. Download and install [Etcher](https://etcher.io) or [Win32 Disk Imager](https://sourceforge.net/projects/win32diskimager/)
2. Write the openipc_v0.2.2.img to your SDcard
3. Open the SDCard and edit the files .wifissid and .wifipasswd to match your network
4. Flash the firmware to the camera:

    - Hold down the setup button for 10 seconds BEFORE connecting power
    - With button still depressed, plug in power to the camera while continuing to hold for another 10 - 12 seconds.
    - Release the button when the connection light blinks continually.
    - Press the button again and you should hear a Chinese voice prompt if successful.

6. Reboot camera and reinsert SDcard after boot
7. Run openipscan.sh and find the IP address of your new OpenIP Camera.
8. Proceed to the status web page and apply the hacks. http://[discoveredipaddress]/cgi-bin/status

*Congratulations*! Welcome to OpenIPC.

RTSP: 
rtsp://ipaddress/unicast

SSH:
root/ismart12

Thanks to [samtap](https://github.com/samtap/) for [fanghacks](https://github.com/samtap/fanghacks) used as the base for OpenIPC. Thanks to [joeand37](https://github.com/joeand37) for inspiration. Thanks to the various other developers on the fanghacks page who cross-compiled some of the binaries.
