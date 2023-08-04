FROM ubuntu
RUN apt-get update && \
    apt-get install -y git openssh-client rsync
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
