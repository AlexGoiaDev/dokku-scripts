# Introducción
Scripts para agilizar la creación de aplicaciones con dokku.
- init-dokku.sh instala dokku y letsencrypt
- create-app.sh crea una nueva aplicación y la configura por defecto para producción

## Ubuntu
### Instalar dokkku con configuración básica 
Para ello usamos el script init-dokku.sh
1. Descargamos:
``` 
wget -O init-dokku.sh https://raw.githubusercontent.com/AlexGoiaDev/dokku-scripts/master/init-dokku.sh
```

2. Ejecutamos:
``` 
sh init-dokku.sh www.dominio.es email@letsencrypt.es
```
