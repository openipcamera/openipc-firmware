##OpenIPC Install##

Support Wyze and Xiaomi Fang Cams

##Installation Instructions:##

1. Download and install Etcher or Win32 Disk Imager
2. Write the openipc_firmware-v0.2.2.img to your SDcard
3. Open the SDCard and edit the files .wifissid and .wifipasswd to match your network
4. Flash the firmware to the camera:

    Hold down the setup button for 10 seconds BEFORE connecting power
    With button still depressed, plug in power to the camera and continue to hold for another 10 -12 seconds and wait until the connection light blinks continually.
    Press setup button and you should hear a Chinese voice prompt if successful.

6. Reboot camera and reinsert SDcard after boot
7. Run openipscan.sh and find the IP address of your new OpenIP Camera.
8. Proceed to the status web page and apply the hacks. http://ipaddresshere/cgi-bin/status

Congratulations! Welcome to OpenIPC.

Thanks to samtap for fanghacks used as the base for OpenIPC. Thanks to joeand37 for inspiration. Thanks to the various other developers on the fanghacks page who cross-compiled some of the binaries.
