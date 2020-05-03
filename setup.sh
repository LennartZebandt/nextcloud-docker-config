#!/bin/bash

read -p "Specify a username for the postgres database user: `echo $'\n> '`" postgresUser
read -p "Specify a password for the postgres password: `echo $'\n> '`" postgresPassword
read -p "Specify a username for the nextcloud admin: `echo $'\n> '`" nextcloudUser
read -p "Specify a password for the nextcloud admin: `echo $'\n> '`" nextcloudPassword
read -p "Specify the domain for the nextcloud server: `echo $'\n> '`" nextcloudDomain
read -p "Specify the domain for the document server: `echo $'\n> '`" documentServerDomain
read -p "Specify the mail for issuing the Let's Encrypt certificate: `echo $'\n> '`" letsEncryptMail
read -p "Specify a secret for the validation for the document server: `echo $'\n> '`" documentServerSecret

cp ./env_files/postgres.example.env ./env_files/postgres.env
sed -i "s/%USER/${postgresUser}/g" ./env_files/postgres.env
sed -i "s/%PW/${postgresPassword}/g" ./env_files/postgres.env

cp ./env_files/documentserver.example.env ./env_files/documentserver.env
sed -i "s/%USER/${postgresUser}/g" ./env_files/documentserver.env
sed -i "s/%PW/${postgresPassword}/g" ./env_files/documentserver.env
sed -i "s/%SECRET/${documentServerSecret}/g" ./env_files/documentserver.env

cp ./env_files/nextcloud.example.env ./env_files/nextcloud.env
sed -i "s/%USER/${nextcloudUser}/g" ./env_files/nextcloud.env
sed -i "s/%PW/${nextcloudPassword}/g" ./env_files/nextcloud.env
sed -i "s/%NC_DOMAIN/${nextcloudDomain}/g" ./env_files/nextcloud.env

cp .example.env .env
sed -i "s/%NC_DOMAIN/${nextcloudDomain}/g" .env
sed -i "s/%DOC_SERVER_DOMAIN/${documentServerDomain}/g" .env

cp ./traefik/traefik.example.toml ./traefik/traefik.toml
sed -i "s/%NC_DOMAIN/${nextcloudDomain}/g" ./traefik/traefik.toml
sed -i "s/%DOC_SERVER_DOMAIN/${documentServerDomain}/g" ./traefik/traefik.toml
sed -i "s/%MAIL/${letsEncryptMail}/g" ./traefik/traefik.toml

if [ ! -f ./traefik/acme.json ]; then
    touch ./traefik/acme.json
    chmod 600 ./traefik/acme.json 
fi
