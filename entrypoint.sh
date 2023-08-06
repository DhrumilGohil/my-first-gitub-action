#!/bin/sh -l

mkdir -p ~/.ssh
echo "-----OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
QyNTUxOQAAACDCEY7A396Fq3XACY4PXu+DzuoDre46xNjxZjoAikYdqgAAAKDa76tc2u+r
XAAAAAtzc2gtZWQyNTUxOQAAACDCEY7A396Fq3XACY4PXu+DzuoDre46xNjxZjoAikYdqg
AAAEAQ/WmAkWXv9trzdVZygBjD7aZPKEE3hQ3kiiSTOk3Z7cIRjsDf3oWrdcAJjg9e74PO
6gOt7jrE2PFmOgCKRh2qAAAAGGRocnVtaWxnb2hpbDE3QGdtYWlsLmNvbQECAwQF
-----END OPENSSH PRIVATE KEY-----" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
ssh-keyscan -H $HOST_NAME >> ~/.ssh/known_hosts

rsync -avz * $HOST_USER@$HOST_NAME:~/test

ssh $HOST_USER@$HOST_NAME '
            cd ~/test
            git clone git@github.com:DhrumilGohil/laravel-test-deploy.git
            composer install
            # Create .env file (assuming you have all necessary environment variables set as secrets in GitHub)
            echo "APP_ENV=production" >> .env
            echo "APP_NAME=Laravel" >> .env
            echo "APP_DEBUG=false" >> .env
            echo "DB_CONNECTION=$DB_CONNECTION" >> .env
            echo "DB_HOST=$DB_HOST" >> .env
            echo "DB_PORT=$DB_PORT" >> .env
            echo "DB_DATABASE=$DB_DATABASE" >> .env
            echo "DB_USERNAME=$DB_USERNAME" >> .env
            echo "DB_PASSWORD=$DB_PASSWORD" >> .env
            echo "APP_KEY=" >> .env
            php artisan migrate:fresh — seed
            chmod -R o+w storage/ bootstrap/ 
            php artisan key:generate
            php artisan cache:clear
            php artisan config:clear
            php artisan route:clear
            php artisan view:clear
            php artisan config:clear
            composer dump-autoload 
            php -S 0.0.0.0:8000 -t public/
            '



