#!/bin/bash

# Replace 'Escribe-tu-token' with your actual Telegram bot token
TELEGRAM_TOKEN="6809134013:AAFwfIW1Jvj4gGnRPAG_28_O2p__dlCXzqs"

# Replace 'Escribe-tu-chat-id' with your actual chat ID
CHAT_ID="6485900541"

# Nombre del archivo donde se guardarán los mensajes
mensaje_file="/home/2asir/Escritorio/ManoliBot/MensajesManoli.txt"

# Función para enviar mensajes de respuesta
send_message() {
    local message="$1"
    curl -s -X POST "https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendMessage" -d "chat_id=${CHAT_ID}&text=${message}"
}

# Función para ejecutar comandos y enviar el resultado como mensaje
execute_command() {
    local command="$1"
    local result
    result=$(eval "$command" 2>&1)
    send_message "$result"
}

# Obtener el último ID de actualización procesado
get_last_update_id() {
    if [[ -f last_update_id.txt ]]; then
        cat last_update_id.txt
    else
        echo 0
    fi
}

# Guardar el último ID de actualización procesado y limpiar el archivo
save_last_update_id() {
    local update_id="$1"
    echo "$update_id" > last_update_id.txt
}

# Leer los mensajes entrantes del bot de Telegram
while true; do
    # Obtener el último ID de actualización procesado
    last_update_id=$(get_last_update_id)

    # Obtener las actualizaciones desde el último ID de actualización procesado
    updates=$(curl -s "https://api.telegram.org/bot${TELEGRAM_TOKEN}/getUpdates?offset=$((last_update_id + 1))")

    # Verificar si hay mensajes nuevos
    if [[ $(jq '.result | length' <<< "$updates") -gt 0 ]]; then
        # Leer cada mensaje nuevo
        jq -c '.result[]' <<< "$updates" | while read -r update; do
            # Obtener el tipo del mensaje
            type=$(jq -r '.message.chat.type' <<< "$update")

            # Verificar si es un mensaje de chat y no una actualización de entrega
            if [[ "$type" == "private" ]]; then
                # Obtener el texto del mensaje
                text=$(jq -r '.message.text' <<< "$update")

                # Guardar el mensaje en el archivo
                echo "$text" >> "$mensaje_file"

                # Procesar el comando recibido
                case "$text" in
                    "/start")
                        send_message "¡Hola! Soy un bot de Telegram. Puedes enviarme comandos para ejecutar en el servidor."
                        ;;
                    "/ayuda")
                        send_message "Lista de comandos disponibles:\n/ayuda - Muestra esta ayuda\n/ejecutar [comando] - Ejecuta un comando en el servidor"
                        ;;
                    # Comando para ejecutar comandos en el servidor
                    "/ejecutar "*)
                        command_to_execute="${text#/ejecutar }"
                        execute_command "$command_to_execute"
                        ;;
                    *)
                        send_message "Comando desconocido. Usa /ayuda para ver la lista de comandos disponibles."
                        ;;
                esac
            fi
        done

        # Guardar el ID de la última actualización procesada
        last_processed_update_id=$(jq -r '.result[-1].update_id' <<< "$updates")
        save_last_update_id "$last_processed_update_id"
    fi

    # Esperar antes de verificar nuevas actualizaciones
    sleep 1
done
