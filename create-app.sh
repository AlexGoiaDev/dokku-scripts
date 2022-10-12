# /bin/bash
if [ -z "$1" ]
  then
    echo "Required app-name, ex: my-awesome-app"
    exit 1
fi

if [ -z "$2" ]
  then
    echo "Required domain, ex. awesome.es"
    exit 1
fi

NO_FORMAT="\033[0m"
C_SPRINGGREEN2="\033[38;5;47m"
C_STEELBLUE1="\033[38;5;75m"
C_ORANGE1="\033[38;5;214m"

echo "${C_ORANGE1}BASH CREATED BY TWISS${NO_FORMAT}"
echo "${C_ORANGE1}Creates an ssl node app with dokku ${NO_FORMAT}"
echo "${C_STEELBLUE1}DOMAIN:${NO_FORMAT} $1"
echo "${C_STEELBLUE1}EMAIL (letsencrypt):${NO_FORMAT} $2"

echo "1. Obtaining bash..."
echo "2. Executing bash:"
echo "3. Creating app..."
# dokku apps:create $1
echo "4. Setting domain to app..."
# dokku domains:set $1 $2
echo "5. Adding SSL to app..."
# dokku letsencrypt:true $1
echo "6. Auto renew SSL...:"
# dokku letsencrypt:cron-job --add
echo "7. Set production"
# dokku config:set nombre_de_la_app NODE_ENV=production