#!/bin/bash

# --- CATEGORÍAS DE PAQUETES ---

# 1. Base del Sistema y Gráficos
BASE_SISTEMA=(
    xorg xterm                   # Servidor gráfico y terminal básica
    lightdm lightdm-gtk-greeter  # Gestor de inicio de sesión
    bspwm sxhkd                  # Gestor de ventanas y de atajos
)

# 2. Entorno y Estética
ENTORNO_VISUAL=(
    polybar rofi picom           # Barra, menú y transparencias
    feh nitrogen                 # Fondos de pantalla
    dunst                        # Notificaciones
#    conky                        # Monitor de sistema en escritorio
    lxappearance                 # (Sugerido) Para cambiar temas e iconos
)

# 3. Herramientas de Archivos y Sistema
UTILIDADES=(
    thunar                       # Gestor de archivos ligero
    tilix                        # Tu terminal favorita
    htop btop glances            # Monitoreo de procesos
    dysk                         # Alternativa favorita a df
    tree zip unzip               # Manejo de directorios y compresión
    curl wget                    # Descargas y repositorios
    inxi                         # Información de hardware
    arandr                       # Configuración de monitores
    nm-tray                      # Icono de red en la barra
)

# 4. Desarrollo y Programación
# Nota: build-essential ya incluye gcc, g++, make y librerías base
DESARROLLO=(
    build-essential devscripts   # Herramientas de compilación
    python3 python3-pip          # Entorno Python
    perl ruby                    # Otros lenguajes
    default-jre                  # Java
    vim micro                    # Editores de texto por terminal
)

# 5. Multimedia
MULTIMEDIA=(
    mpv vlc                      # Reproductores de video
    pamixer alsa-utils           # (Sugerido) Control de volumen para Polybar
)

# --- EJECUCIÓN ---

echo "Iniciando instalación organizada..."
sudo apt update

# Instalamos todo junto en un solo comando
sudo apt install -y \
    "${BASE_SISTEMA[@]}" \
    "${ENTORNO_VISUAL[@]}" \
    "${UTILIDADES[@]}" \
    "${DESARROLLO[@]}" \
    "${MULTIMEDIA[@]}"

echo "Instalación completada con éxito."