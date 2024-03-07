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

## Comprobaciones:

Desde nuestro Telegram, vamos a nuestro bot:

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/2f30d6cd-9049-498c-b05d-8e1023fc7fd4)
