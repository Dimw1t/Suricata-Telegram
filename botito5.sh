#!/bin/bash

# Ruta del archivo de registro
log_file="/var/log/suricata/fast.log"
botito_log="/var/log/suricata/botito.log"
mensaje_log="/var/log/suricata/Alerta.txt"
fecha_actual=$(date +"%Y-%m-%d")
# Obtener la última IP y el último mensaje del archivo de registro
last_ip=$(awk '{print $1}' "$log_file" | tail -n 1)
last_mssg=$(cat "$log_file")

# Leer la última IP almacenada en el archivo botito.log
stored_ip=$(cat "$botito_log")

# Comparar la última IP con la almacenada
if [ "$last_ip" != "$stored_ip" ]; then
    # Las IPs son diferentes, continuar con el script

    # Crear un archivo temporal para el mensaje
    temp_file=$(mktemp)
    echo "$last_mssg" > "$temp_file"

    # Leer el archivo temporal línea por línea
    while IFS= read -r line; do
        # Verificar si la línea contiene la cadena específica
        if [[ ! "$line" == *" {TCP} 172.26.17.35:"* ]]; then
            # Si no contiene la cadena, agregar la línea al archivo mensaje.txt
            echo "$line" >> $mensaje_log
        fi
    done < "$temp_file"

    # Replace 'XXXXX' with your actual Telegram bot token and 'YYYYY' with your actual chat ID
    telegram_bot_token="6954425885:AAFLwqa_4ZNt_UCwJIOruHmXsLYS6GfhpM0"
    chat_id="6485900541"

    # Construct the curl command with the obtained IP address and file upload
    curl_command="curl -F document=@${mensaje_log} \
     -H 'Content-Type:multipart/form-data' \
     'https://api.telegram.org/bot${telegram_bot_token}/sendDocument?chat_id=${chat_id}&caption=${last_ip}'"

    # Execute the curl command
    eval "$curl_command"

    # Eliminar el archivo temporal
    rm "$temp_file"

    # Actualizar el archivo botito.log con la última IP
    echo "$last_ip" > "$botito_log"

   cp /var/log/suricata/fast.log /var/log/suricata/copias_fast/copia.$fecha_actual
   echo " " >/var/log/suricata/fast.log
   echo " ">/var/log/suricata/Alerta.txt
else
    echo "no hay novedades"
fi
