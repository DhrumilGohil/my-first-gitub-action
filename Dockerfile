FROM ubuntu
COPY entrypoint.sh /entrypoint.
ENTRYPOINT ["/entrypoint.sh"]
