FROM debian:stable-slim

ADD locale.gen /etc/

RUN apt-get update \
 && apt-get -y dist-upgrade \
 && apt-get -y install bash locales mosh openssh-server screen \
 && rm -rf /var/lib/apt/lists/* \
 && locale-gen \
 && mkdir -p /run/sshd \
 && sed -i 's/^.*#\?.*PermitRootLogin.*$/PermitRootLogin no/' /etc/ssh/sshd_config \
 && sed -i 's/^.*#\?.*PasswordAuthentication.*$/PasswordAuthentication no/' /etc/ssh/sshd_config

EXPOSE 22 60001

ENTRYPOINT ["/usr/sbin/sshd","-D"]
