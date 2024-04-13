#! /bin/bash



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

' > /etc/apt/sources.list

echo ' actualizando repositorios '
apt update 

echo ' actualizando repositorios '
apt upgrade -y

echo ' instalando sudo '
apt install sudo neofetch -y

echo "
alias buscar='apt search'
alias instalar='apt install'
alias l='ls -l'
alias ll='ls -la'
alias nf='neofetch'
alias e='exit'
alias act='apt update && apt upgrade'
alias eliminar='apt-get --purge remove'
alias v='vim'
neofetch

" >> ~/.bashrc

apt install git -y

source .bashrc

nano /etc/sudoers

exit








