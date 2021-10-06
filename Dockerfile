FROM debian:stable-slim

RUN apt-get update \
 && apt-get -y dist-upgrade \
 && apt-get -y install bash openssh-server mosh screen \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /run/sshd \ 
 && sed -i 's/^.*#\?.*PermitRootLogin.*$/PermitRootLogin no/' /etc/ssh/sshd_config \
 && sed -i 's/^.*#\?.*PasswordAuthentication.*$/PasswordAuthentication no/' /etc/ssh/sshd_config

EXPOSE 22 60001

ENTRYPOINT ["/usr/sbin/sshd","-D"]
