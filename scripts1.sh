#! /bin/bash



echo 'deb https://deb.debian.org/debian/ trixie main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian/ trixie main contrib non-free non-free-firmware


deb https://debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware
deb-src https://debian.org/debian-security/ trixie-security main contrib non-free non-free-firmware


deb https://deb.debian.org/debian/ trixie-updates main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian/ trixie-updates main contrib non-free non-free-firmware' | sudo tee /etc/apt/sources.list 


echo ' actualizando repositorios '
apt update 

echo ' actualizando repositorios '
apt upgrade -y

echo ' instalando sudo '
apt install sudo fastfetch -y

echo "
alias apagar='sudo shutdown now'
alias reiniciar='sudo reboot now'
alias ff='fastfetch'
alias nv='~/AppimagePaketes/nvim-linux-x86_64.appimage'
alias p3='python3'
alias buscar='sudo apt search'
alias instalar='sudo apt install'
#alias l='ls -l'
alias l='lsd -l'
#alias ld='ls -l --group-directories-first'
alias ld='lsd -l --group-directories-first'
#alias ll='ls -la'
alias ll='lsd -la'
#alias lld='ls -la --group-directories-first'
alias lld='lsd -la --group-directories-first'
#alias nf='neofetch' desactualizado
alias e='exit'
alias act='sudo apt update && sudo apt upgrade -y'
alias eliminar='sudo apt-get --purge remove'

alias gi='git init'
alias ga='git add'
alias gad='git add .'
alias gc='git commit'
alias gp='git push'
alias gs='git status'
alias gss='git status -s'
alias gl='git log'
alias glo='git log --oneline'
alias gb='git git branch'
alias gcl='git clone'
alias raspby='ssh minimini@192.168.0.27'
alias pingraspby='ping 192.168.0.27'

# ff ejecuta fastfecth
ff

" >> ~/.bashrc

apt install git -y

source .bashrc

echo 'no olvidar de editar el archivo= /etc/sudoers y ejecutar el segundo scripts con sudo'

exit








