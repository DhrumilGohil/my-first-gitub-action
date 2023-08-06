FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y git openssh-client rsync
RUN     echo "$SSH_PRIVATE_KEY" && mkdir -p ~/.ssh && ls
        
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
