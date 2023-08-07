FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y git openssh-client rsync
COPY .ssh /root/.ssh
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
