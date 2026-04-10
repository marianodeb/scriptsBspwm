#!/bin/bash

#mi scripts para instalar Bspwm 

sudo apt install -y xorg xterm lightdm lightdm-gtk-greeter bspwm sxhkd polybar rofi jgmenu suckless-tools tint2 feh nitrogen tilix picom conky dunst nm-tray nm-tray-l10n xtitle thunar arandr curl htop wget inxi vim build-essential devscripts glances

sudo apt install -y build-essential make
sudo apt install -y htop tree zip unzip
sudo apt install -y gcc g++ python3 python3-pip perl ruby
sudo apt install -y dysk # altervativa mejor al comando df 
sudo apt install -y git curl 
sudo apt install -y default-jre # java
sudo apt install -y mpv vlc #reproductores de videos

echo "Creando directorios bspwm polybar sxhkd conky"

mkdir -p ~/.config/{bspwm,polybar,sxhkd,conky,jgmenu}

echo "copiando archivos examples de bspwm polybar sxhkd conky " xtitl

echo "copiando archivo bspwm"
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm
echo "copiando archivo sxhkd"
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd
echo "copiando archivo polybar"
cp /usr/share/doc/polybar/examples/config.ini ~/.config/polybar
echo "copiando archivo conky"
cp /etc/conky/conky.conf ~/.config/conky
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
echo 'agregar las siguientes lineas en el archivo bspwm:
pgrep -x picom > /dev/null || picom --config $HOME/.config/picom/picom.conf 
modificar el archivo polybar nombrar [bar/examples] por [bar/bar1] como en el archivo launch.sh

'
echo "agregando lineas al archivo ~/.config/bspwm/bspwmrc debe ir al inicio"

echo '$HOME/.config/polybar/launch.sh  &' >> ~/.config/bspwm/bspwmrc

curl -LO https://github.com/lsd-rs/lsd/releases/download/v1.1.5/lsd-musl_1.1.5_amd64.deb

sudo apt install btop -y

echo 'descargar comandos propios https://github.com/marianodeb/scriptscomandos.git'
git clone https://github.com/marianodeb/scriptscomandos.git

