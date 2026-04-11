#! /bin/bash



echo 'deb https://deb.debian.org/debian/ trixie main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian/ trixie main contrib non-free non-free-firmware


deb https://deb.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware


deb https://deb.debian.org/debian/ trixie-updates main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian/ trixie-updates main contrib non-free non-free-firmware' | sudo tee /etc/apt/sources.list 


echo ' actualizando repositorios '
apt update 

echo ' actualizando repositorios '
apt upgrade -y

echo ' instalando sudo '
apt install sudo fastfetch -y

echo 'no olvidar de editar el archivo= /etc/sudoers y ejecutar el segundo scripts con sudo'









