#!/bin/bash

# alias
cat << 'EOF' >> ~/.bashrc

# --- Alias Personales ---
alias actualizarsistema="sudo apt update && sudo apt upgrade -y && flatpak update -y && sudo snap refresh"
alias apagar='sudo shutdown now'
alias reiniciar='sudo reboot now'
alias ff='fastfetch'
alias nv='~/AppimagePaketes/nvim-linux-x86_64.appimage'
alias p3='python3'
alias buscar='sudo apt search'
alias instalar='sudo apt install'
alias l='lsd -l'
alias ld='lsd -l --group-directories-first'
alias ll='lsd -la'
alias lld='lsd -la --group-directories-first'
alias e='exit'
alias act='sudo apt update && sudo apt upgrade -y'
alias eliminar='sudo apt-get --purge remove'



# --- Git Alias ---
alias gi='git init'
alias ga='git add'
alias gad='git add .'
alias gc='git commit'
alias gp='git push'
alias gs='git status'
alias gss='git status -s'
alias gl='git log'
alias glo='git log --oneline'
alias gb='git branch'
alias gcl='git clone'

# --- Otros ---
alias raspby='ssh minimini@192.168.0.27'
alias pingraspby='ping 192.168.0.27'
alias peke='ssh peke@192.168.0.41'
alias pingpeke='ping 192.168.0.41'
alias cerrarss='bspc quit' #cierra cesion de usuario

# --- flatpak ---
alias actflat='flatpak update' # actualiza todo
alias listaflat='flatpak list --app'
alias eliminarflat='flatpak uninstall' # mas el id de la aplicacion
alias eliminaflatt='flatpak uninstall --delete-data' # mas id elina todo + configuraciones
alias limpiarflat='flatpak uninstall --unused' # limpia archivos obsoletos

# --- snap ---
alias actsnap='sudo snap refresh' # actualiza todos los snap
alias listasnap='snap list'
alias eliminarsnap='sudo snap remove' # mas nombre del paquete
alias eliminasnapt='sudo snap remove --purge' # mas nombre del paquete elimina todo 

# Ejecutar fastfetch al abrir
ff

EOF