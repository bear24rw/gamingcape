echo "Compiling dts"
dtc -O dtb -o BEAGLEBOY-00A0.dtbo -b 0 -@ BEAGLEBOY-00A0.dts
echo "Installing dts"
cp BEAGLEBOY-00A0.dtbo /lib/firmware/
echo "Installing systemd service"
cp gamingcape.service /etc/systemd/system/
echo "Enabling systemd service"
systemctl enable gamingcape.service
echo "Mounting boot partition"
mount /dev/mmcblk0p1 /mnt/card
echo "Backing up uEnv.txt"
cp /mnt/card/uEnv.txt /mnt/card/uEnv.txt.backup
echo "Editing boot args to disable hdmi"
echo "optargs=quiet drm.debug=7 capemgr.disable_partno=BB-BONELT-HDMI,BB-BONELT-HDMIN" > /mnt/card/uEnv.txt
echo "Unmounting partition"
umount /mnt/card/
