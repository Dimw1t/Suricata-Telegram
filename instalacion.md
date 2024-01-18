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


