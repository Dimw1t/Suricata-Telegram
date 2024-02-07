## Configuración Alertas con telegram

Para habilitar las alertas de Telegram, simplemente sigue estos pasos y utiliza el script proporcionado (bobito4.sh) incluido en este repositorio

- 1- Copia el script bobito5.sh en el directorio /etc/suricata. [Enlace al script](botito5.sh)

- 2- Modificamos los parametros **telegram_bot_token** y **chat_id**. Puedes encontrar estos parámetros en la plataforma Telegram al crear un nuevo bot.

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/67c26142-2b9a-4c7e-91a4-8a50338a1d71)

- 3- Configura un cron para ejecutar el script con la frecuencia que mejor se adapte a tus necesidades.

``` Crontab -e```

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/aed53f86-ba5f-487b-9e14-5e119b4c6df7)

Siguiendo estos pasos, las alertas de Suricata serán enviadas a través de Telegram según la configuración que hayas establecido. Asegúrate de ajustar la frecuencia del cron y otros parámetros según tus preferencias y requisitos específicos.
