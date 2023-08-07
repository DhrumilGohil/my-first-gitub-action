FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y git openssh-client rsync
RUN pwd
RUN ls ~/
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
