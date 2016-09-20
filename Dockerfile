FROM debian:jessie

RUN apt-get update && apt-get install -y apt-utils varnish vim

RUN mkdir /etc/varnish/default

COPY conf/default.vcl /etc/varnish/default/default.vcl

CMD /usr/sbin/varnishd -P /run/varnishd.pid -a :6081 -F -T localhost:6082 -f /etc/varnish/default/default.vcl -S /etc/varnish/secret -s malloc,256m
