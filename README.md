# Suricata-Telegram

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/69f3fdbf-19c8-4932-996a-a2b25d7baf4c)


## Introducción

Este proyecto tiene como objetivo mejorar la visibilidad y la respuesta ante las alertas generadas por Suricata, un sistema de detección y prevención de intrusos de código abierto. Integrando Suricata con Telegram, este notificador proporciona una solución eficaz para recibir notificaciones instantáneas sobre posibles amenazas y actividades sospechosas directamente en tu dispositivo móvil a través de la aplicación de mensajería Telegram.

**Características destacadas:**

- Integración sencilla con Suricata.
- Notificaciones instantáneas a través de Telegram.
- Mejora la capacidad de respuesta ante posibles amenazas.
- Personalización de alertas según tus necesidades.

## Instalación

1. Añadimos el repositorio

```
add-apt-repository ppa:oisf/suricata-stable
```

2. Actualización e Instalación

```
apt-get update
apt-get install suricata
```

3. Activamos el inicio Automático

```
systemctl enable suricata
```

## Configuración

### Configuración básica

1. Entramos en el archivo de configuración

```
nano /etc/suricata/suricata.yaml
```

2. Comprobamos que la ruta de los logs sea correcta.

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/d8553575-dd5a-4b7d-8024-dba2e7168825)


3. En este apartado configuramos nuestras interfaces de red, se pueden añadir tantas como tengamos.

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/46ccd33a-9965-449d-8c92-25c82a5c3120)

Guardamos y cerramos el archivo. 

Hay más configuraciones que se pueden modificar según las necesidades, aquí se han modificado solo las básicas para el servicio. 

### Creacción y administración de reglas y alertas

#### Reglas para nmap

  1. Creamos el directorio

```
mkdir -p /etc/suricata/rules
```

- Copiar el archivo local.rules de este repositorio y pegarlo en /etc/suricata/rules/local.rules [Enlace aquí](local.rules)

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/23f42020-14c3-421e-8af5-6fbfd6a5712f)

  2. Entramos de nuevo en el archivo de configuración

```
nano /etc/suricata/suricata.yaml
```

  3. Añadimos la nueva regla (local.rules)

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/e28338a6-e31d-4fbf-8055-e732a19a66e7)


```
systemctl restart suricata
```


Una vez lleguemos hasta aqui pordemos comprobar que suricata funciona. 
Hacemos un nmap -sT -A (ip) y comprobamos los logs de suricata. 

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/e75cad5a-361d-43f4-bfca-970837ffaade)

Ejecutamos el comando:

```
tail -f /var/log/suricata/fast
```

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/86570241-f661-4552-bf8c-b19a9274a96a)

Como podemos comprobar nos da una información detallada del nmap que acabo de recibir. 
