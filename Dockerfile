FROM debian:stable-slim

RUN apt-get update \
 && apt-get -y dist-upgrade \
 && apt-get -y install bash openssh-server mosh screen \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 22 60001

ENTRYPOINT ["/usr/sbin/sshd","-D"]
