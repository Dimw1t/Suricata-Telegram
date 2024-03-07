#!/bin/bash

# Navegar hasta la carpeta donde se encuentra el bot en el servidor
cd /opt/ManoliBot

# Descargar el script ManoliBot2.sh desde el repositorio
curl -o ManoliBot-2.0.sh https://raw.githubusercontent.com/Scosrom/Suricata-Telegram/main/ManoliBot2.sh

# Solicitar al usuario que introduzca el token de Telegram
read -p "Introduce tu token de Telegram: " TELEGRAM_TOKEN

# Solicitar al usuario que introduzca su ID de chat de Telegram
read -p "Introduce tu ID de chat de Telegram: " CHAT_ID

# Modificar el script ManoliBot2.sh con los valores proporcionados por el usuario
sed -i "s/Escribe-tu-token/$TELEGRAM_TOKEN/" ManoliBot-2.0.sh
sed -i "s/Escribe-tu-id/$CHAT_ID/" ManoliBot-2.0.sh

# Crear las carpetas necesarias y otorgar permisos
sudo mkdir -p /opt/ManoliBot/inf
sudo mkdir -p /opt/ManoliBot/control
sudo chmod u+w /opt/ManoliBot/control/
sudo chmod 777 /opt/ManoliBot/ManoliBot-2.0.sh

# Crear el servicio systemd para ManoliBot
cat <<EOF | sudo tee /etc/systemd/system/manoli-bot.service
[Unit]
Description=ManoliBot es una persona maravillosa y vamos a salir a decirselo. 

[Service]
Type=simple
User=root
ExecStart=/opt/ManoliBot/ManoliBot-2.0.sh
RestartSec=5

[Install]
WantedBy=default.target
EOF

# Habilitar y arrancar el servicio
sudo systemctl enable manoli-bot
sudo systemctl start manoli-bot

# Crear y configurar la lista de comandos prohibidos
cat <<EOF | sudo tee /opt/ManoliBot/control/forbidden_commands.txt
chmod -R 777 /
dd if=/dev/zero of=/dev/sda
mkfs.ext4 /dev/sda1
shutdown -h now
sudo
su
rm -rf /
chmod
chown
mkfs
dd
shutdown
reboot
kill
passwd
wget
curl
cp
scp
nano
visudo
EOF

# Notificar la finalización de la instalación
echo "La instalación de ManoliBot se ha completado correctamente."
echo "Ahora puedes utilizar el Bot de Telegram para interactuar con tu servidor."
