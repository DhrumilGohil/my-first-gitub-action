FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y git openssh-client rsync
COPY ~/.ssh /.ssh
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
