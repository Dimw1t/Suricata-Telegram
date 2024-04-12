## Creacción y administración de reglas y alertas

Suricata utiliza firmas para activar alertas, por lo que es necesario instalarlas y mantenerlas actualizadas. Las firmas también se denominan reglas, de ahí el nombre de archivos de reglas . Con la herramienta, suricata-update las reglas se pueden buscar, actualizar y administrar para proporcionarlas a Suricata.

Ejecutamos el modo predeterminado que recupera el conjunto de reglas de ET Open:

```
sudo suricata-update
```
Luego, se instalan las reglas, ```/var/lib/suricata/rules``` que también son las predeterminadas en la configuración y utilizan el único archivo. ``` suricata.rules ```

Para mantener actualizadas las reglas de detección de amenazas en Suricata y ver las fuentes disponibles:

```
sudo suricata-update update-sources
sudo suricata-update list-sources
```
Cada conjunto de reglas tiene un nombre que comienza con el nombre del proveedor y luego describe el propósito o tipo de amenazas que aborda. Por ejemplo, el conjunto de reglas de identificación de tráfico de OISF se llama "oisf/trafficid".

Para habilitar un conjunto de reglas específico, como "oisf/trafficid":

```
sudo suricata-update enable-source oisf/trafficid
sudo suricata-update
```
Puedes habilitar otros conjuntos de reglas de la misma manera, por ejemplo:

```
sudo suricata-update enable-source sslbl/ssl-fp-blacklist
sudo suricata-update enable-source ptresearch/attackdetection
```
Puedes habilitar otros conjuntos de reglas de la misma manera, por ejemplo:

```
sudo suricata-update enable-source sslbl/ssl-fp-blacklist
sudo suricata-update enable-source ptresearch/attackdetection
```
Para ver las fuentes habilitadas:

```
sudo suricata-update list-enabled-sources
```

La respuesta debería incluir los conjuntos de reglas habilitados.

Y finalmente, para aplicar los cambios y descargar las reglas habilitadas:

```
sudo suricata-update
```
Si deseas deshabilitar o eliminar una fuente específica, por ejemplo, "et/pro":

```
suricata-update disable-source et/pro 
```

O para eliminar completamente:

```
suricata-update remove-source et/pro
```



- - - 

- [Reglas para NMAP](nmap.md)

