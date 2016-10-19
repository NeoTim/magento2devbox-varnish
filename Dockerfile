FROM debian:jessie

RUN apt-get update && apt-get install -y apt-utils varnish vim

RUN mkdir /etc/varnish/default

COPY conf/default.vcl /etc/varnish/default/default.vcl

ADD conf/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
