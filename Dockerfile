FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y git openssh-client rsync
RUN mkdir -p ~/.ssh && touch ~/.ssh/id_rsa
RUN echo "-----OPENSSH PRIVATE KEY-----\
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW\
QyNTUxOQAAACDCEY7A396Fq3XACY4PXu+DzuoDre46xNjxZjoAikYdqgAAAKDa76tc2u+r\
XAAAAAtzc2gtZWQyNTUxOQAAACDCEY7A396Fq3XACY4PXu+DzuoDre46xNjxZjoAikYdqg\
AAAEAQ/WmAkWXv9trzdVZygBjD7aZPKEE3hQ3kiiSTOk3Z7cIRjsDf3oWrdcAJjg9e74PO\
6gOt7jrE2PFmOgCKRh2qAAAAGGRocnVtaWxnb2hpbDE3QGdtYWlsLmNvbQECAwQF\
-----END OPENSSH PRIVATE KEY-----" >  ~/.ssh/id_rsa && echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMIRjsDf3oWrdcAJjg9e74PO6gOt7jrE2PFmOgCKRh2q dhrumilgohil17@gmail.com" >> ~/.ssh/known_hosts
RUN ssh-keygen -l -f ~/.ssh/id_rsa
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
