FROM ubuntu:latest

RUN apt update && apt install -y nmap ncat iputils-ping

ENTRYPOINT ["/usr/bin/ncat"]
CMD ["-h"]
