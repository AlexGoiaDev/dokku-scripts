# /bin/bash
if [ -z "$1" ]
  then
    echo "Required domain example www.customer.es"
    exit 1
fi

if [ -z "$2" ]
  then
    echo "Required letsencrypt email, examp yourfancyemail@gmail.com"
    exit 1
fi
NO_FORMAT="\033[0m"
C_SPRINGGREEN2="\033[38;5;47m"
C_STEELBLUE1="\033[38;5;75m"
C_ORANGE1="\033[38;5;214m"
echo "${C_ORANGE1}BASH CREATED BY TWISS${NO_FORMAT}"
echo "${C_ORANGE1}Installs and settup dokku with ssl domain${NO_FORMAT}"
echo "${C_STEELBLUE1}DOMAIN:${NO_FORMAT} $1"
echo "${C_STEELBLUE1}EMAIL (letsencrypt):${NO_FORMAT} $2"
echo "Initial server settings with Dokku"
echo "1. Obtaining bash..."
wget -O bootstrap.sh https://raw.githubusercontent.com/dokku/dokku/v0.28.1/bootstrap.sh
echo "${C_SPRINGGREEN2}OK, i got that bash :P${NO_FORMAT}"
echo "2. Executing bash:"
sudo DOKKU_TAG=v0.28.1 bash bootstrap.sh
echo "${C_SPRINGGREEN2}GREAT, I installed that bash!${NO_FORMAT}"
echo "3. Asociating ssh-key with admin name:"
cat ~/.ssh/authorized_keys | sudo dokku ssh-keys:add admin
echo "${C_SPRINGGREEN2}SSH KEY asociaed! :)${NO_FORMAT}"
echo "4. Setting global domain to ${1}"
dokku domains:set-global $1
echo "${C_SPRINGGREEN2} Domain running great!${NO_FORMAT}"
echo "5. Adding letsencrypt plugin:"
sudo dokku plugin:install https://github.com/dokku/dokku-letsencrypt.git
echo "6. Setting letsencrypt email to ${2}"
dokku config:set --global DOKKU_LETSENCRYPT_EMAIL=$2
dokku letsencrypt:cron-job --add
echo "Summary: ${C_STEELBLUE1}https://$1 ${NO_FORMAT}encrypted with letsencrypt(${C_STEELBLUE1}$2${NO_FORMAT})"