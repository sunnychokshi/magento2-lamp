#!/bin/bash
set -e

# Create Deployment User & Password & Set Password
if [ ! -f docker_initialized ]; then
	useradd -d /var/www/html/ -g www-data -s /bin/bash $USER
	usermod -p $(echo $PASSWORD | openssl passwd -1 -stdin) $USER
	touch docker_initialized
fi

if [ ! -f docker_initialized ]; then
	usermod -p $(echo $ROOTPASS | openssl passwd -1 -stdin) root
	touch docker_initialized
fi

exec "$@"
