#!/bin/sh -l

mkdir -p /root/.ssh
echo "$SSH_PRIVATE_KEY" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
ssh-keyscan -H "$HOST_NAME" >> /root/.ssh/known_hosts


#rsync -avz . $HOST_USER@$HOST_NAME:~/test
rsync -avz --exclude .git --exclude .github --exclude .env . $HOST_USER@$HOST_NAME:/opt/easyengine/sites/ee-laravel.com/app/htdocs

ssh -v $HOST_USER@$HOST_NAME '
            cd /opt/easyengine/sites/ee-laravel.com/app/htdocs
            mv ~/.env /opt/easyengine/sites/ee-laravel.com/app/htdocs
            ls
            mv public custom_public
            composer install
            php artisan migrate:fresh — seed
            chmod -R o+w storage/ bootstrap/ 
            php artisan key:generate
            php artisan cache:clear
            php artisan config:clear
            php artisan route:clear
            php artisan view:clear
            php artisan config:clear
            '



