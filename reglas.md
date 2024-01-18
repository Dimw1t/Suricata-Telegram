## Creacción y administración de reglas y alertas

Suricata utiliza firmas para activar alertas, por lo que es necesario instalarlas y mantenerlas actualizadas. Las firmas también se denominan reglas, de ahí el nombre de archivos de reglas . Con la herramienta, suricata-updatelas reglas se pueden buscar, actualizar y administrar para proporcionarlas a Suricata.

Ejecutamos el modo predeterminado que recupera el conjunto de reglas de ET Open:

```
sudo suricata-update
```
Luego, se instalan las reglas, ```/var/lib/suricata/rules``` que también son las predeterminadas en la configuración y utilizan el único archivo. ``` suricata.rules ```
- - - 

- [Reglas para NMAP](nmap.md)

