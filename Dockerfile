FROM debian:stretch
MAINTAINER fueller

ENV LANG C.UTF-8

VOLUME /config
VOLUME /recordings
EXPOSE 9270 9271

RUN apt-get update
RUN apt-get install -y wget dbus dbus-x11 gconf2 supervisor
RUN ln -s /config /opt/TVMosaic
RUN wget -nv http://tv-mosaic.com/download/624e68fb8cfab4ce8d277d4a416af741 -O tvmosaic.deb
RUN dpkg -i tvmosaic.deb

RUN mkdir -p /var/log/supervisord
RUN mkdir /var/run/dbus
ADD /etc/supervisor/conf.d/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD /etc/init.d/mosaic.sh /etc/init.d/mosaic.sh
RUN chmod +x /etc/init.d/mosaic.sh
    
ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c", "/etc/supervisor/conf.d/supervisord.conf"]
