FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y git openssh-client rsync
RUN     echo "$SSH_PRIVATE_KEY" \
        mkdir -p ~/.ssh \
        echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa \
        chmod 600 ~/.ssh/id_rsa \
        ssh-keyscan $HOST_NAME >> ~/.ssh/known_hosts 
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
