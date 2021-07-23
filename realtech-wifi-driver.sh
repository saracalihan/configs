pmInstall="pacman -S"

sudo su
cd
$pmInstall git build-essential dkms
git clone https://github.com/tomaspinho/rtl8821ce
cd rtl8821ce
chmod +x dkms-install.sh
chmod +x dkms-remove.sh
./dkms-install.sh
reboot
