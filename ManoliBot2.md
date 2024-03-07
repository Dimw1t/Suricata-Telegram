# Ejecutar comandos desde Telegram


Hasta este punto, hemos configurado un sistema de detección de intrusos utilizando Suricata, el cual nos envía alertas a Telegram cuando se detecta alguna intrusión en nuestro servidor. Ahora, vamos a implementar la funcionalidad necesaria para interactuar con nuestro Bot de Telegram y ejecutar comandos en el servidor.

Este proceso nos permitirá utilizar el Bot de Telegram para enviar comandos al servidor y recibir los resultados de su ejecución directamente en nuestra conversación de Telegram. Esto añade una capa adicional de accesibilidad y control sobre nuestro servidor, ya que podemos gestionarlo y realizar acciones específicas sin necesidad de acceder al terminal directamente.

1. Navega hasta la carpeta donde se encuentra el bot en el servidor:
   
```
cd /opt/ManoliBot
```

2.Agrega el script  [ManoliBot2.sh](ManoliBot2.sh) que se encuentra en este repositorio.

```
nano ManoliBot-2.0.sh
```

3.Crea las carpetas necesarias y otorga los permisos adecuados:

```
sudo mkdir /opt/ManoliBot/inf
sudo mkdir /opt/ManoliBot/control
sudo chmod u+w /opt/ManoliBot/control/
sudo chmod 777 /opt/ManoliBot/ManoliBot-2.0.sh

```

4. Crea el servicio systemd para ManoliBot.

Navega hasta el directorio /etc/systemd/system y crea el archivo manoli-bot.service con el siguiente contenido:

```
nano manoli-bot.service
```

```
[Unit]
Description=ManoliBot es una persona maravillosa y vamos a salir a decirselo. 

[Service]
Type=simple
User=root
ExecStart=/opt/ManoliBot/ManoliBot-2.0.sh
RestartSec=5

[Install]
WantedBy=default.target

```
Guarda y cierra el editor.


5. Ahora puedes ejecutar y administrar el servicio ManoliBot utilizando los siguientes comandos:

```
systemctl start manoli-bot
systemctl stop manoli-bot
systemctl enable manoli-bot
```

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/443b91b3-f5bc-42b2-a59a-9fedc704edb3)

### Lista de Comandos Prohibidos

Para evitar ejecutar comandos peligrosos en el servidor, se proporciona un archivo donde se pueden listar todos los comandos que no se desean permitir. 

1. Crea un nuevo archivo llamado forbidden_commands.txt utilizando el editor de texto de tu preferencia. Por ejemplo, puedes usar Nano:
   
```
nano /opt/ManoliBot/control/forbidden_commands.txt
```

2. En este archivo, puedes agregar los comandos que no deseas permitir. A continuación se proporciona un ejemplo de cómo podrías estructurar este archivo:
   
![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/021a1269-e64e-4acb-b28d-2c681ce05108)

```
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
```
Guarda los cambios y cierra el editor. Ahora, los comandos listados en este archivo no podrán ser ejecutados a través del bot de Telegram.

## Comprobaciones:

Desde nuestro Telegram, vamos a nuestro bot:

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/2f30d6cd-9049-498c-b05d-8e1023fc7fd4)
