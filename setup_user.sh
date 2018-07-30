#!/bin/bash
dpkg --add-architecture i386
add-apt -y-repository ppa:webupd8team/java
#add-apt -y-repository ppa:wine/wine-builds
add-apt -y-repository ppa:js-reynaud/kicad-4
add-apt -y-repository ppa:caffeine-developers/ppa
add-apt -y-repository ppa:nilarimogard/webupd8
add-apt -y-repository ppa:libreoffice/ppa

#apt -y-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
#echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt -y/sources.list.d/spotify.list

wget -nc https://dl.winehq.org/wine-builds/Release.key
apt -y-key add Release.key
sudo apt -y-add-repository https://dl.winehq.org/wine-builds/ubuntu/

apt -y update
apt -y update && apt -y upgrade

apt -y install ubuntu-restricted-extras
apt -y install oracle-java8-installer oracle-java8-set-default

#cd deb/ && dpkg -i *.deb && apt -y install -fy
#cd ../
#apt -y install -fy
#apt -y install google-chrome-stable
#apt -y update && apt -y upgrade
#apt -y install dropbox
#apt -y install yandex-disk

apt -y install blueman
apt -y remove --purge chrome-gnome-shell
apt -y install caffeine
apt -y install apt -yitude gdebi gparted xterm nedit gcc g++ make emacs mc htop vim at apcalc tree gnuplot unetbootin extlinux lynx wavemon smartmontools
apt -y install checkinstall cutecom minicom powertop at links2 w3m w3m-img luckybackup pavucontrol  geany cpu-checker iotop sysstat procinfo synapt -yic 
apt -y install pulseaudio-equalizer
apt -y install lm-sensors
apt -y install vlc gimp blender audacity 
#apt -y install spotify-client
apt -y autoremove && apt -y clean 

apt -y install stardict stardict-plugin stardict-plugin-espeak stardict-plugin-festival
cd ./stardict/ && dpkg -i *.deb && apt -y install -fy

apt -y install shutter tagainijisho thunderbird 
apt -y install xsane djview bless inkscape  doublecmd-qt
apt -y install comix pcsxr dosbox
apt -y install alien
apt -y install antimicro

apt -y-get install --install-recommends winehq-devel
apt -y install winbind playonlinux
apt -y remove winetricks
wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
mv -v winetricks /usr/local/bin
apt -y install qtiplot
apt -y install fbreader calibre
apt -y install meld woeusb
apt -y install cuneiform yagf aspell aspell-en aspell-ru
apt -y install iverilog gtkwave ngspice electric irsim
apt -y install magic alliance
apt -y install eagle fritzing
apt -y install scilab
apt -y install octave
#apt -y install texmaker 
#apt -y install  gummi texlive-extra-utils texlive-latex-base texlive-xetex
#apt -y install r-base r-recommended r-cran-rcmdr
#apt -y install sublime-text
apt -y install kicad kicad-library kicad-doc-en
apt -y install -fy
apt -y update && apt -y upgrade
apt -y install -fy
apt -y autoremove && apt -y clean 

sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop
echo -e "\nHidden=true\n" | sudo tee --append /etc/xdg/autostart/tracker-extract.desktop /etc/xdg/autostart/tracker-miner-apps.desktop /etc/xdg/autostart/tracker-miner-fs.desktop /etc/xdg/autostart/tracker-miner-user-guides.desktop /etc/xdg/autostart/tracker-store.desktop > /dev/null
gsettings set org.freedesktop.Tracker.Miner.Files crawling-interval -2  
gsettings set org.freedesktop.Tracker.Miner.Files enable-monitors false  
tracker reset --hard   

systemctl disable NetworkManager-wait-online.service
systemctl disable ModemManager.service
systemctl disable plymouth-quit-wait
systemctl mask plymouth-quit-wait
systemctl disable speech-dispatcher
systemctl mask speech-dispatcher
systemctl disable rsyslog
systemctl mask rsyslog
systemctl disable fwupd
systemctl mask fwupd
systemctl disable gpu-manager
systemctl mask gpu-manager
systemctl disable nvidia-persistenced.service
systemctl mask nvidia-persistenced.service
systemctl disable apport.service
systemctl mask apport.service
systemctl disable avahi-daemon
systemctl mask avahi-daemon
systemctl disable networking.service
systemctl mask networking.service
systemctl disable irqbalance
systemctl mask irqbalance
cp 71-ti-permissions.rules /etc/udev/rules.d
service udev restart

exit 0