# Funcionamiento de las Alertas en Telegram
Telegram es una aplicación de mensajería instantánea que permite enviar mensajes, fotos, videos y otros archivos de forma segura y rápida. Para recibir alertas en Telegram, necesitas configurar un bot que actúe como intermediario entre tu sistema y la plataforma de Telegram. Aquí está el proceso general:

### Creación del Bot en Telegram:

1- Para crear un bot en Telegram, necesitas comunicarte con BotFather, que es el bot oficial de Telegram encargado de crear y gestionar bots.
Inicia una conversación con BotFather y utiliza el comando /newbot para crear un nuevo bot. Sigue las instrucciones para proporcionar un nombre y un nombre de usuario para tu bot.
Obtención del Token del Bot:

2- Después de crear el bot, BotFather te proporcionará un token único que necesitarás para interactuar con la API de Telegram en nombre de tu bot. Este token actúa como una especie de contraseña para tu bot y debes mantenerlo seguro.

### Configuración de Parámetros:

3- Una vez que tengas el token de tu bot, puedes utilizarlo para enviar y recibir mensajes a través de la API de Telegram. Además del token, también necesitarás el chat_id, que es el identificador único de la conversación a la que quieres enviar mensajes. Puedes obtener este ID enviando un mensaje al bot que has creado y luego utilizando la API de Telegram para recuperar el chat_id.

### Envío de Mensajes:

4- Con el token del bot y el chat_id, puedes enviar mensajes a través de la API de Telegram utilizando diferentes métodos proporcionados por la API, como sendMessage para enviar mensajes de texto, sendPhoto para enviar imágenes, sendDocument para enviar documentos, etc.


## Configuración Alertas con Telegram

Para habilitar las alertas de Telegram, simplemente sigue estos pasos y utiliza el script proporcionado (bobito4.sh) incluido en este repositorio

- 1- Copia el script bobito.sh en el directorio /etc/suricata. [Enlace al script](botito.sh)

- 2- Modificamos los parametros **telegram_bot_token** y **chat_id**. Puedes encontrar estos parámetros en la plataforma Telegram al crear un nuevo bot.

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/67c26142-2b9a-4c7e-91a4-8a50338a1d71)

- 3- Configura un cron para ejecutar el script con la frecuencia que mejor se adapte a tus necesidades.

``` Crontab -e```

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/2a1fd81c-8706-4155-80ed-0036bf115abd)

Siguiendo estos pasos, las alertas de Suricata serán enviadas a través de Telegram según la configuración que hayas establecido. Asegúrate de ajustar la frecuencia del cron y otros parámetros según tus preferencias y requisitos específicos.
