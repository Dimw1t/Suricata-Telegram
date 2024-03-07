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

Entramos en el directorio /etc/init.d y creamos el siguiente archivo.

```
nano manoli-bot
```
Y pegamos el siguiente contenido

```
#!/bin/sh
### BEGIN INIT INFO
# Provides:          manoli_bot
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start/stop ManoliBot script
# Description:       This script manages the execution of ManoliBot.sh as a service.
### END INIT INFO

# Ruta al script ManoliBot.sh
MANOLIBOT_SCRIPT="/home/2asir/Escritorio/ManoliBot/beta/ManoliBot-1.0.sh"
PIDFILE="/var/run/manoli_bot.pid"

# Función para iniciar el servicio
start_service() {
    echo "Iniciando ManoliBot..."
    # Iniciar ManoliBot en segundo plano y guardar su PID
    nohup "$MANOLIBOT_SCRIPT" >/dev/null 2>&1 &
    echo $! > "$PIDFILE"
}

# Función para detener el servicio
stop_service() {
    echo "Deteniendo ManoliBot..."
    # Obtener el PID del proceso ManoliBot
    if [ -f "$PIDFILE" ]; then
        PID=$(cat "$PIDFILE")
        # Detener el proceso ManoliBot
        kill "$PID"
        rm "$PIDFILE"
    else
        echo "ManoliBot no está en ejecución."
    fi
}

case "$1" in
    start)
        start_service
        ;;
    stop)
        stop_service
        ;;
    restart)
        stop_service
        start_service
        ;;
    *)
        echo "Uso: $0 {start|stop|restart}"
        exit 1
        ;;
esac
```

Ahora ya podemos Ejecutar y parar nuestro servicio utilizando: 

```
systemctl start manoli-bot
systemctl stop manoli-bot
```
