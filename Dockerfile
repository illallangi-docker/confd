FROM docker.io/fedora:31

MAINTAINER Andrew Cole <andrew.cole@illallangi.com>

RUN yum -y install which; \
    yum -y update; \
    yum -y clean all

COPY entrypoint.sh /entrypoint.sh
COPY contrib/confd-0.16.0-linux-amd64 /usr/local/bin/confd

RUN chmod +x \
        /entrypoint.sh \
        /usr/local/bin/confd

VOLUME /etc/confd
VOLUME /target

ENTRYPOINT ["/entrypoint.sh"]