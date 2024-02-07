## Instalación

Instalación sobre la version: Ubuntu 22.04.3

Actualizar sistema:
```
apt update
apt upgrade
```
Este comando instala un conjunto de herramientas comunes que son necesarias para administrar los repositorios de software en Ubuntu y distribuciones basadas en Debian.
```
sudo apt-get install software-properties-common
```
Agrega un nuevo repositorio de software a tu sistema

```
sudo add-apt-repository ppa:oisf/suricata-stable
```
Actualiza la lista de paquetes disponibles en los repositorios de software configurados en tu sistema para que refleje los cambios realizados al agregar el nuevo repositorio.

```
sudo apt update
```
Instala Suricata

```
sudo apt install suricata jq
```
Puedes verificar qué versión de Suricata tienes ejecutando y con qué opciones, así como el estado del servicio:

```
sudo suricata --build-info
sudo systemctl status suricata
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

Determine las interfaces y las direcciones IP en las que Suricata debería inspeccionar los paquetes de red:

```
af-packet:
    - interface: enp0s3
      cluster-id: 99
      cluster-type: cluster_flow
      defrag: yes
      use-mmap: yes
      tpacket-v3: yes
```

Guardamos y cerramos el archivo. 

Hay más configuraciones que se pueden modificar según las necesidades, aquí se han modificado solo las básicas para el servicio. 


