# Nextcloud-docker-config

> Actual development and issue managment happens on [Gitlab](https://gitlab.com/lennartZebandt/Nextcloud-docker-config)

This is my Nextcloud configuration combining the use of Docker Compose, Traefik, Let's Encrypt, Redis, Postgres and an optional OnlyOffice Documentserver. The purpose of the containers are documented in the docker-compose.yml files.
Additionally, credentials are passed to the containers via .env files, these files should not be checked into version control.
To make handling of the env files easier I created example files that are checked into version control and a bash script that generates them.

## Usage

### Setup

This script creates the env files for the containers, the Traefik config file and an empty acme.json file with correct permissions for Let's Encrypt.
If you keep your repository private you can check the traefik.toml into version control, because it doesn't contain any sensitive data.
But if you host a private Nextcloud instance, you probably don't want the URL or your Email in a public repo.

```console
./scripts/setup.sh
```

After that the script will ask you for your credentials and other configs that needed to be present in the env files.

### Start

This script starts the docker containers in detached mode.

```console
./scripts/start.sh
```

### OnlyOffice Setup

There are still some manual steps required to set up the OnlyOffice Integration:

1. After a successful login to the Nextcloud Webpage navigate to the top right and select the section “Apps”.

2. After that navigate to the menu on the left and select "Featured apps". There should be an app called “ONLYOFFICE”, make sure that it's installed and enabled.

3. Next you should navigate to the section "Settings" on the top right menu and then select “ONLYOFFICE” on the left side.

4. Fill in your Domain you specified for the OnlyOffice Documentserver during the execution of the setup script in the field "Document Editing Service address”. The Domain should look like this “https://mydomain.com/”

5. Select “Advanced server settings” and put the same Domain into the field “Document Editing Service address for internal requests from the server".
In the field “Server address for internal requests from the Document Editing Service” you should put the Domain you specified for the Nextcloud instance during setup.

6. Press save and you should get a success message.

## System requirements

I was able to run the setup including the OnlyOffice Documentserver on a cheap Server with 1 vCPU and 2GB RAM. But I never tried using it with multiple persons at the same time. Have a look a the official requirements from Nextcloud and OnlyOffice to have a better idea about the requirements:

[Nextcloud System requirements](https://docs.Nextcloud.com/server/16/admin_manual/installation/system_requirements.html)

[OnlyOffice Documentserver with Docker Compose](https://helpcenter.onlyoffice.com/server/docker/document/docker-compose.aspx)
