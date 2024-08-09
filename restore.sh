#!/bin/bash

# Faylı tapmasa beyni çönür ha.
if [ ! -f apt-package-list.txt ]; then
    echo "Məni dəvədıllağı yerinə qoymusan ala? Zəhmət olmasa, bu içini sihdiyimin apt-package-list.txt faylını düz-qoş sora məni narahat ele, blet."
    exit 1
fi

# Əvvəlcə lazım olan paketləri quraşdırır
sudo apt-get update
sudo apt-get install -y toilet figlet neofetch jp2a code

# Paketləri bərpa etmək üçün sistemə yenidən baxırıq
sudo apt-get clean
sudo apt-get full-upgrade -y
sudo apt-get autoremove -y
sudo apt-get clean && clear

# Siyahıdakı paketləri quraşdırır
sudo dpkg --set-selections < apt-package-list.txt
sudo apt-get dselect-upgrade -y

echo "Bütün paketlərin əmcəyi dağıldı."
