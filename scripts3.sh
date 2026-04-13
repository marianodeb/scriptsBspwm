#!/bin/bash



# alias
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
alias cerrarss='bspc quit'
# ff ejecuta fastfecth
ff

" >> ~/.bashrc

#mi scripts para instalar Bspwm 
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

echo "agregando lineas al archivo ~/.config/bspwm/bspwmrc debe ir al inicio"

#echo '$HOME/.config/polybar/launch.sh  &' >> ~/.config/bspwm/bspwmrc
# Esto inserta la línea en la segunda línea del archivo (después del #!/bin/bash)
sed -i '2i $HOME/.config/polybar/launch.sh &' ~/.config/bspwm/bspwmrc

curl -LO https://github.com/lsd-rs/lsd/releases/download/v1.1.5/lsd-musl_1.1.5_amd64.deb

echo 'agregar las siguientes lineas en el archivo bspwm:
echo 'pgrep -x picom > /dev/null || picom --config $HOME/.config/picom/picom.conf' >> ~/.config/bspwm/bspwmrc
modificar el archivo polybar nombrar [bar/examples] por [bar/bar1] como en el archivo launch.sh

'

echo 'descargar comandos propios https://github.com/marianodeb/scriptscomandos.git'
git clone https://github.com/marianodeb/scriptscomandos.git

#!/bin/bash

echo "************************"
echo "*** Instalando kitty ***"
echo "************************"

#Descarga e instalacion
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Crear el directorio bin
mkdir -p ~/.local/bin

# Crear enlaces simbolicos
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/

# Agrefgar bin a al paht
export PATH=$HOME/.local/bin:$PATH

# Copiar el archivo kitty.desktop para que kitti aparezca en el menu de aplicaciones
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/

# Esto hace que aparezca elicono en el menu de aplicaciones
sed -i "s|Icon=kitty|Icon=$HOME/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop
sed -i "s|Exec=kitty|Exec=$HOME/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty.desktop

update-desktop-database ~/.local/share/applications/

echo "************************"
echo "***** kitten themes ****"
echo "************************"

# link de computadoras y sensores instalacion y configuracion
# https://www.youtube.com/watch?v=_oqf2WgEyxo
# https://sw.kovidgoyal.net/kitty/
# https://sw.kovidgoyal.net/kitty/conf/

# CONFIGURACION
# Crear el archivo kitty.conf en el directorio ~/.config/kitty
# la mejor manera de crear el archivo kitty.conf es con: "Ctrl + shift + f2" donde viene todala configuracion comentada

# Cambiar Thema   https://sw.kovidgoyal.net/kitty/kittens/themes/
# Escribimos en la terminal: "kitten themes" y saldra el menu de tehme
# Para seleccionar el thema y quede guardado seleccionar la opciion M 
# Luego se creara un archivo con los themas.
