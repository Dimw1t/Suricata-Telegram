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

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/24d66af1-a03c-41d1-b057-5966160b7625)

* Por defecto viene /var/log/suricata/ y hay que añadirle rules/

3. En este apartado configuramos nuestras interfaces de red, se pueden añadir tantas como tengamos.

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/46ccd33a-9965-449d-8c92-25c82a5c3120)

Guardamos y cerramos el archivo. 

Hay más configuraciones que se pueden modificar según las necesidades, aquí se han modificado solo las básicas para el servicio. 

### Creacción y administración de reglas y alertas

#### Reglas para nmap

- Copiar el archivo local.rules de este repositorio y pegarlo en /etc/suricata/rules/local.rules [Enlace aquí](local.rules)

  
