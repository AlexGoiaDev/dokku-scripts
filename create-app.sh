 /bin/bash
if [ -z "$1" ]
  then
    echo "Required app name"
    exit 1
fi

if [ -z "$2" ]
  then
    echo "Required domain"
    exit 1
fi

echo "${C_ORANGE1}BASH CREATED BY TWISS${NO_FORMAT}"
echo "${C_ORANGE1}Creates an ssl app ${NO_FORMAT}"
echo "${C_STEELBLUE1}DOMAIN:${NO_FORMAT} $1"
echo "${C_STEELBLUE1}EMAIL (letsencrypt):${NO_FORMAT} $2"