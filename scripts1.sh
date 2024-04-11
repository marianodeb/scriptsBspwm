#! /bin/bash

su -

echo '
deb http://deb.debian.org/debian bookworm contrib main non-free non-free-firmware
deb-src http://deb.debian.org/debian bookworm contrib main non-free non-free-firmware

deb http://deb.debian.org/debian-security/ bookworm-security contrib main non-free non-free-firmware
deb-src http://deb.debian.org/debian-security/ bookworm-security contrib main non-free non-free-firmware

deb http://deb.debian.org/debian bookworm-updates contrib main non-free non-free-firmware
deb-src http://deb.debian.org/debian bookworm-updates contrib main non-free non-free-firmware

deb https://ftp.debian.org/debian/ bookworm-proposed-updates contrib main non-free non-free-firmware
deb-src https://ftp.debian.org/debian/ bookworm-proposed-updates contrib main non-free non-free-firmware

deb http://deb.debian.org/debian bookworm-backports contrib main non-free  non-free-firmware
deb-src http://deb.debian.org/debian bookworm-backports contrib main non-free non-free-firmware

' > /etc/apt/source.list

echo ' actualizando repositorios '
apt update 

echo ' actualizando repositorios '
apt upgrade -y

echo ' instalando sudo '
apt install sudo

nano /etc/sudoers










