FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y git openssh-client rsync
RUN mkdir -p ~/.ssh
RUN echo "$SSH_PRIVATE_KEY" >  ~/.ssh/id_rsa && echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMIRjsDf3oWrdcAJjg9e74PO6gOt7jrE2PFmOgCKRh2q dhrumilgohil17@gmail.com" >> ~/.ssh/known_hosts
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
