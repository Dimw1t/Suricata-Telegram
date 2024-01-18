## Reglas para nmap



- Copiar el archivo ```local.rules``` de este repositorio y pegarlo en /var/lib/suricata/rules/local.rules [Enlace aquí](local.rules)

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

#### Comprobación 

Una vez lleguemos hasta aqui pordemos comprobar que suricata funciona. 
Hacemos un nmap -sT -A (ip) y comprobamos los logs de suricata. 

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/e75cad5a-361d-43f4-bfca-970837ffaade)

Ejecutamos el comando:

```
tail -f /var/log/suricata/fast
```

![image](https://github.com/Scosrom/Suricata-Telegram/assets/114906778/86570241-f661-4552-bf8c-b19a9274a96a)

Como podemos comprobar nos da una información detallada del nmap que acabo de recibir. 
