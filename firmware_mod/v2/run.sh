echo "Starting OpenIPC"
CONFIGPATH=/system/sdcard/config

## Update hostname:
hostname -F $CONFIGPATH/hostname.conf

## Load kernel modules
insmod /driver/tx-isp.ko isp_clk=100000000
##insmod /driver/sensor_imx323.ko
insmod /driver/sensor_jxf22.ko
##insmod /driver/sensor_ps5230.ko
insmod /driver/exfat.ko
insmod /driver/sample_motor.ko
insmod /driver/audio.ko spk_gpio=-1 sign_mode=0
insmod /driver/sinfo.ko
##insmod /driver/8189es.ko
insmod /driver/sample_pwm_core.ko
insmod /driver/sample_pwm_hal.ko
insmod /driver/rtl8189ftv.ko
##insmod /system/sdcard/driver/sensor_jxf22.ko data_interface=2 pwdn_gpio=-1 res                                                                    et_gpio=18 sensor_gpio_func=0

## Start Wifi:
wpa_supplicant -D nl80211 -iwlan0 -c $CONFIGPATH/wpa_supplicant.conf -B &
sleep 5
#udhcpc -i wlan0 -s /system/etc/udhcpc.script -q
udhcpc -i wlan0 -p /var/run/udhcpc.pid -b -x hostname:"$(hostname)"

## NTP Server
ntp_srv="$(cat "$CONFIGPATH/ntp_srv.conf")"
/system/sdcard/bin/busybox ntpd -q -n -p "$ntp_srv" # run ntp update

## Start FTP & SSH
/system/sdcard/bin/dropbearmulti dropbear -R
/system/sdcard/bin/bftpd -d

## Start Webserver:
/system/sdcard/bin/boa -c /system/sdcard/config/

## Autostart
for i in /system/sdcard/config/autostart/*; do
  $i
done

