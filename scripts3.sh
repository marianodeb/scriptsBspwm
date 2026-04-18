#!/bin/bash



# alias
cat << 'EOF' >> ~/.bashrc

# --- Alias Personales ---
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

# Ejecutar fastfetch al abrir
ff

EOF

#mi scripts para instalar Bspwm 
echo "Creando directorios bspwm polybar sxhkd conky"

mkdir -p ~/.config/{bspwm,polybar,sxhkd,conky,jgmenu,picom}

echo "copiando archivos examples de bspwm polybar sxhkd conky picon "

echo "copiando archivo bspwm"
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm
echo "copiando archivo sxhkd"
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd
echo "copiando archivo polybar"
cp /usr/share/doc/polybar/examples/config.ini ~/.config/polybar
#echo "copiando archivo conky"
#cp /etc/conky/conky.conf ~/.config/conky
echo "copiando archivo picom"
cp /usr/share/doc/picom/examples/picom.sample.conf ~/.config/picom/picom.cof

echo "creando y copiando scripts launch.sh"

touch ~/.config/polybar/launch.sh
chmod +x ~/.config/polybar/launch.sh


echo '#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown
#polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."' > ~/.config/polybar/launch.sh

echo 'creando carpetas del usuario'

#sudo apt install xdg-user-dirs 	esto crea los direcotrio Descarga Imagens etc
xdg-user-dirs-update

echo 'agregar temas para rofi'


git clone https://github.com/lr-tech/rofi-themes-collection.git
cd rofi-themes-collection/themes

mkdir -p ~/.local/share/rofi/themes/

cp *.rasi ~/.local/share/rofi/themes/

cd

echo "agregando lineas al archivo ~/.config/bspwm/bspwmrc debe ir al inicio"

#echo '$HOME/.config/polybar/launch.sh  &' >> ~/.config/bspwm/bspwmrc
# Esto inserta la línea en la segunda línea del archivo (después del #!/bin/bash)
sed -i '2i $HOME/.config/polybar/launch.sh &' ~/.config/bspwm/bspwmrc

curl -LO https://github.com/lsd-rs/lsd/releases/download/v1.1.5/lsd-musl_1.1.5_amd64.deb

echo 'agregar las siguientes lineas en el archivo bspwm:'
echo 'pgrep -x picom > /dev/null || picom --config $HOME/.config/picom/picom.conf' >> ~/.config/bspwm/bspwmrc
#modificar el archivo polybar nombrar [bar/examples] por [bar/bar1] como en el archivo launch.sh


# Si no funciona posicionar la linea debajo de: pgrep -x sxhkd > /dev/null || sxhkd &
echo 'pgrep -x nm-tray > /dev/null || nm-tray &' >> ~/.config/bspwm/bspwmrc


echo 'descargar comandos propios https://github.com/marianodeb/scriptscomandos.git'
git clone https://github.com/marianodeb/scriptscomandos.git


echo 'lxpolkit &' >> ~/.config/bspwm/bspwmrc
# NOTAS
# NOTAS#
# Habilitar nitrogen gestor de fondo de pantallas agregar la siguietne linea a bspwmrc :
# nitrogen --restore &
