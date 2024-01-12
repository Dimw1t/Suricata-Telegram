#!/bin/bash

# Ruta del archivo de registro
log_file="/var/log/suricata/fast.log"
botito_log="/var/log/botito.log"

# Obtener la última IP y el último mensaje del archivo de registro
last_ip=$(cat /var/log/suricata/fast.log |awk '{print $1}' "$log_file" | tail -n 1)
last_mssg=$(cat "$log_file")

# Leer la última IP almacenada en el archivo botito.log
stored_ip=$(cat "$botito_log")

# Comparar la última IP con la almacenada
if [ "$last_ip" != "$stored_ip" ]; then
    # Las IPs son diferentes, continuar con el script

    # Crear un archivo temporal para el mensaje
    temp_file=$(mktemp)
    echo "$last_mssg" > "$temp_file"

    # Replace 'XXXXX' with your actual Telegram bot token and 'YYYYY' with your actual chat ID
    telegram_bot_token="[Escribe tu token]"
    chat_id="[Escribe tu ID chat]"

    # Construct the curl command with the obtained IP address and file upload
    curl_command="curl -F document=@${temp_file} \
     -H 'Content-Type:multipart/form-data' \
     'https://api.telegram.org/bot${telegram_bot_token}/sendDocument?chat_id=${chat_id}&caption=${last_ip}'"

    # Execute the curl command
    eval "$curl_command"

    # Eliminar el archivo temporal
    rm "$temp_file"
   
    
# Actualizar el archivo botito.log con la última IP
    echo "$last_ip" > "$botito_log"
   
else
echo "no hay novedades"
fi
