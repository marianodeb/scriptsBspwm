#!/bin/bash

# Detener el script si ocurre algún error grave
set -e

echo "*********************************************************"
echo "******************** CONFIG GIT *************************"
echo "*********************************************************"

GIT_NAME="mariano"
GIT_EMAIL="2022lgk4@gmail.com"

git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

echo "=== Generando clave SSH (Ed25519) ==="
ssh-keygen -t ed25519 -C "$GIT_EMAIL" -f "$HOME/.ssh/id_ed25519" -N "" -q || true

echo "=== Iniciando el agente SSH y añadiendo la clave ==="
eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/id_ed25519"

echo "=== Clave pública generada: ==="
echo "--------------------------------------------------------"
cat "$HOME/.ssh/id_ed25519.pub"
echo "--------------------------------------------------------"

echo "*********************************************************"
echo "****************** INSTALANDO KITTY *********************"
echo "*********************************************************"

# Descarga e instalación oficial de Kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Crear directorios locales
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/applications

# Crear enlaces simbólicos
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/

# Hacer el PATH persistente en el .bashrc
if ! grep -q "$HOME/.local/bin" ~/.bashrc; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >>~/.bashrc
fi
export PATH="$HOME/.local/bin:$PATH"

# Copiar y configurar el acceso directo (.desktop)
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=$HOME/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop
sed -i "s|Exec=kitty|Exec=$HOME/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty.desktop

update-desktop-database ~/.local/share/applications/ || true

echo "*********************************************************"
echo "************************* YAZI **************************"
echo "*********************************************************"

curl -fsSL https://yazi-rs.github.io/builds/yazi-keyring.gpg | sudo tee /usr/share/keyrings/yazi-keyring.gpg >/dev/null
echo 'deb [signed-by=/usr/share/keyrings/yazi-keyring.gpg] https://yazi-rs.github.io/builds/ stable main' | sudo tee /etc/apt/sources.list.d/yazi.list >/dev/null
sudo apt update && sudo apt install yazi

echo "*********************************************************"
echo "*************** KITTY MARKDOWN VIEWER *******************"
echo "*********************************************************"

pip install rich pillow --break-system-packages

# Clonar en directorio temporal para no dejar archivos residuales
TMP_DIR=$(mktemp -d)
git clone https://github.com/parf/Kitty-Markdown-Viewer.git "$TMP_DIR"
chmod +x "$TMP_DIR/kitty-md.py"
sudo mv "$TMP_DIR/kitty-md.py" /usr/local/bin/kitty-md
rm -rf "$TMP_DIR"

echo "*********************************************************"
echo "**************** FUENTES Y CONFIG KITTY *****************"
echo "*********************************************************"

# Crear carpeta de fuentes del usuario
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

# Descargar las fuentes correctamente
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/0xProto.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Meslo.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/NerdFontsSymbolsOnly.zip

# Descomprimir todas las fuentes en la carpeta
unzip -o 0xProto.zip -d "$FONT_DIR/0xProto"
unzip -o Meslo.zip -d "$FONT_DIR/Meslo"
unzip -o NerdFontsSymbolsOnly.zip -d "$FONT_DIR/Symbols"

# Limpiar archivos .zip descargados
rm -f 0xProto.zip Meslo.zip NerdFontsSymbolsOnly.zip

# Regenerar caché de fuentes del sistema
fc-cache -fv

# Configurar automáticamente la fuente dentro de kitty.conf
mkdir -p ~/.config/kitty
cat <<'EOF' >~/.config/kitty/kitty.conf
font_family      0xProto Nerd Font
bold_font        auto
italic_font      auto
bold_italic_font auto
font_size        11.0
EOF

echo "*********************************************************"
echo "********************* STARSHIP **************************"
echo "*********************************************************"

curl -sS https://starship.rs/install.sh | sh -s -- -y

echo 'eval "$(starship init bash)"' >> ~/.bashrc

starship preset gruvbox-rainbow -o ~/.config/starship.toml

echo "--------------------------------------------------------"
echo " ¡Instalación completada! Reiniciá tu terminal o Kitty. "
echo "--------------------------------------------------------"
