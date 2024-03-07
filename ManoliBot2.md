# Ejecutar comandos desde Telegram

En este punto, tenemos un sistemas de detención de intrusos que nos envia alertas a Telegram si detecta alguna intrusion. 
A partir de aqui, vamos a implementar lo necesario, para poder interactuar con el Bot y ejecutar comandos en nuestro servidor. 


1. Entramos en la carpeta donde se encuetra nuestro bot
   
```
cd /opt/ManoliBot
```

2.Añadimos el script [ManoliBot2.sh](ManoliBot2.sh) que se encuentra en este repositorio.

```
nano ManoliBot2.sh
```

3. Otorgamos los permisos

```
chmod 777 ManoliBot2.sh
```

4. Ahora vamos a crear el servicio.

Entramos en el directorio /etc/systemd/system y creamos el siguiente archivo.

```
nano manoli-bot.service
```
Y pegamos el siguiente contenido

```
[Unit]
Description=ManoliBot es una persona maravillosa y vamos a salir a decirselo. 

[Service]
Type=simple
User=root
ExecStart=/opt/ManoliBot/ManoliBot-1.0.sh
RestartSec=5

[Install]
WantedBy=default.target

```

Ahora ya podemos Ejecutar y parar nuestro servicio utilizando: 

```
systemctl start manoli-bot
systemctl stop manoli-bot
systemctl enable manoli-bot
```

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/443b91b3-f5bc-42b2-a59a-9fedc704edb3)

Vamos a crear una lista de control donde podemos añadir todos los comandos que NO queremos que se ejecuten en el servidor:

```
nano /opt/ManoliBot/forbidden_commands.txt
```

Aquí dentro añadiríamos los comandos. Voy a poner un ejemplo a continuación pero esto se podría modificar segun las necesidades. 

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

## Comprobaciones:

Desde nuestro Telegram, vamos a nuestro bot:

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/2f30d6cd-9049-498c-b05d-8e1023fc7fd4)
