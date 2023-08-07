#!/bin/sh -l

mkdir -p /root/.ssh
echo "$SSH_PRIVATE_KEY" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
ssh-keyscan -H "$HOST_NAME" >> /root/.ssh/known_hosts
echo "------"
ls /root -a
echo "------"

 #ssh -v $HOST_USER@$HOST_NAME 'echo "Connected Successfully'

# rsync -avz . $HOST_USER@$HOST_NAME:~/test

# ssh -v $HOST_USER@$HOST_NAME '
#             cd ~/test
#             composer install
#             # Create .env file (assuming you have all necessary environment variables set as secrets in GitHub)
#             echo "APP_ENV=production" >> .env
#             echo "APP_NAME=Laravel" >> .env
#             echo "APP_DEBUG=false" >> .env
#             echo "DB_CONNECTION=$DB_CONNECTION" >> .env
#             echo "DB_HOST=$DB_HOST" >> .env
#             echo "DB_PORT=$DB_PORT" >> .env
#             echo "DB_DATABASE=$DB_DATABASE" >> .env
#             echo "DB_USERNAME=$DB_USERNAME" >> .env
#             echo "DB_PASSWORD=$DB_PASSWORD" >> .env
#             echo "APP_KEY=" >> .env
#             php artisan migrate:fresh — seed
#             chmod -R o+w storage/ bootstrap/ 
#             php artisan key:generate
#             php artisan cache:clear
#             php artisan config:clear
#             php artisan route:clear
#             php artisan view:clear
#             php artisan config:clear
#             composer dump-autoload 
#             php -S 0.0.0.0:8000 -t public/
#             '



