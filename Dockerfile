FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y git openssh-client rsync
RUN mkdir -p ~/.ssh
RUN mkdir -p ~/.ssh/id_rsa
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
