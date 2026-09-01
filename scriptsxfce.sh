#!/bin/bash


# --- CATEGORÍAS DE PAQUETES ---

# 3. Herramientas de Archivos y Sistema
UTILIDADES=(
    tilix                        # Tu terminal favorita
    kitty                        # Otra terminal
    htop btop glances            # Monitoreo de procesos
    dysk                         # Alternativa favorita a df
    tree zip unzip               # Manejo de directorios y compresión
    curl wget                    # Descargas y repositorios
    inxi                         # Información de hardware
    network-manager              # El servivio base para gestionar conexiones
    bluez                        # Herramineta basica para bluetooth
    blueman                      # Gestor grafico e icono de bandeja para bluetooth
    psmisc                       # Contiene killall, fuser y pstree
    xclip                        # Gestion del portapapeles (vital para Neovim)
    brightnessctl                # Control de brillo de pantalla desde la terminal
    gparted                      # Herramienta para formatear etc.
    kcalc                        # Calculadora
    ffmpeg                       # Formatea archvios de video
    gsmartcontrol                # Monitor de unidades de almacenamiento
)

# 4. Desarrollo y Programación
# Nota: build-essential ya incluye gcc, g++, make y librerías base
DESARROLLO=(
    build-essential devscripts   # Herramientas de compilación
    python3 python3-pip          # Entorno Python
    perl ruby                    # Otros lenguajes
    default-jre                  # Java
    micro                        # Editores de texto por terminal
)

# 5. Multimedia
MULTIMEDIA=(
    mpv vlc                      # Reproductores de video
    cmus                         # Reproductor de musica x terminal
)

# --- EJECUCIÓN ---

echo "Iniciando instalación organizada..."
sudo apt update

# Instalamos todo junto en un solo comando
sudo apt install -y \
    "${UTILIDADES[@]}" \
    "${DESARROLLO[@]}" \
    "${MULTIMEDIA[@]}"


ace-of-penguins #Juego solitario


















