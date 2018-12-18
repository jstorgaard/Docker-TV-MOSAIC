FROM ubuntu:18.04
LABEL maintainer="jstorgaard"

ENV LANG C.UTF-8

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils
#RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget dbus dbus-x11 gconf2 supervisor htop nano procps lsof libgtk2.0 tzdata
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget dbus dbus-x11 gconf2 htop nano procps lsof libgtk2.0 tzdata
RUN wget -nv http://tv-mosaic.com/download/624e68fb8cfab4ce8d277d4a416af741 -O tvmosaic.deb && \
    dpkg -i tvmosaic.deb && rm tvmosaic.deb
    
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#RUN mkdir -p /var/log/supervisord
RUN mkdir /var/run/dbus
#COPY /etc/supervisor/conf.d/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY /etc/init.d/mosaic.sh /etc/init.d/mosaic.sh
RUN chmod +x /etc/init.d/mosaic.sh

RUN mkdir /opt-start && mv /usr/local/bin/tvmosaic /opt-start && mv /opt/TVMosaic /opt-start

VOLUME [ "/opt/TVMosaic", "/recordings", "/usr/local/bin/tvmosaic" ]
EXPOSE 9270 9271

#ENTRYPOINT ["/usr/bin/supervisord"]
#CMD ["-c", "/etc/supervisor/conf.d/supervisord.conf"]
ENTRYPOINT ["/etc/init.d/tvmosaic"]
CMD ["start"]
