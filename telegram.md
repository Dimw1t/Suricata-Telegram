## Configuración Alertas con telegram

Para configurar las Alertas de Telegram solo tendremos que copiar el script bobito4.sh que incluye este repositorio. Guardar en el sistema, y crear un cron con el periodo que mas se adapte a nuestras necesidades que ejecute este script. 

[Enlace al script](botito4.sh)

1. Copiamos el Script botito4.sh dentro de ```/etc/suricata```

2. Modificamos los parametros **telegram_bot_token** y **chat_id**

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/67c26142-2b9a-4c7e-91a4-8a50338a1d71)

3. Creamos un Cron

``` Crontab -e```

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/aed53f86-ba5f-487b-9e14-5e119b4c6df7)
