Agregar una nueva fuente de reglas

Es posible agregar nuevas reglas de una fuente en particular.

Primero actualice la lista de fuentes disponibles:

```
sudo suricata-update update-sources
```

Luego vea las fuentes disponibles:

```
sudo suricata-update list-sources
```

Para verificar qué fuentes ya están activadas, ejecute el siguiente comando:

```
sudo suricata-update list-enabled-sources
```

Active una nueva fuente, por ejemplo, la fuente de las reglas oisf / trafficid .

```
sudo suricata-update enable-source oisf/trafficid
```

Luego, debe actualizar las reglas (consulte Actualización de las reglas).

Actualizar las reglas

Para integrar la detección de las últimas amenazas, es necesario actualizar periódicamente las reglas de Suricata ejecutando el siguiente comando:

```
sudo suricata-update --disable-conf=/etc/suricata/disable.conf
```

Entonces todo lo que tiene que hacer es reiniciar el servicio Suricata:

```
sudo systemctl restart suricata.service
```
4. Verificar el estado de Suricata
Para asegurarnos de que Suricata se esta ejecutando, miremos los logs de suricata.

```
$ sudo tail /var/log/suricata/suricata.log
```
