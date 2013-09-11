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
echo "Disabling some services"
systemctl disable mpd
systemctl disable gdm
echo "Enabling autologin"
cp getty@tty1.service /etc/systemd/system/getty.target.wants/
echo "Changing default shell to bash"
chsh -s /bin/bash
echo "Intalling bash_profile"
cp bash_profile .bash_profile
echo "Disabling git sslVerify"
git config --global http.sslVerify false
echo "Updating opkg"
opkg update
echo "Installing python-distutils"
opkg install python-distutils
echo "Installing python-compile"
opkg install python-compile

# wget http://prdownloads.sourceforge.net/scons/scons-2.3.0.tar.gz
# tar xvf scons-2.3.0.tar.gz
# cd scons-2.3.0
# python setup.py install

# git clone "https://github.com/bear24rw/gamingcape_fceu.git"
# cd gamingcape_fceu
# scons
