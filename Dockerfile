# Set the base image to Ubuntu 
FROM ubuntu:14.04

# File Author / Maintainer 
MAINTAINER fueller

# Update and install files
RUN apt-get update && apt-get install lsof sysstat wget iproute2 iputils-ping openssh-server supervisor dbus dbus-x11 consolekit libpolkit-agent-1-0 libpolkit-backend-1-0 policykit-1 python-aptdaemon python-pycurl python3-aptdaemon.pkcompat -qy 

## download and install TV MOSAIC
RUN wget -O tvmosaic-pc-linux-ubuntu-x86_64.deb https://tv-mosaic.com/download/624e68fb8cfab4ce8d277d4a416af741/ && \
    dpkg -i tvmosaic-pc-linux-ubuntu-x86_64.deb && apt-get install -f && rm -f tvmosaic-pc-linux-ubuntu-x86_64.deb
    
## Openssh Server and supervisord
RUN mkdir -p /var/log/supervisord
RUN mkdir -p /var/run/sshd
RUN mkdir /var/run/dbus
RUN locale-gen en_US.utf8
RUN useradd docker -d /home/docker -g users -G sudo -m                                                                                                                    
RUN echo docker:test123 | chpasswd
ADD /etc/supervisor/conf.d/supervisord.conf /etc/supervisor/conf.d/supervisord.conf 

## DVBLink start script
ADD /etc/init.d/mosaic.sh /etc/init.d/mosaic.sh
RUN chmod +x /etc/init.d/mosaic.sh

## Prepare start ##
RUN mkdir /opt-start && mv /usr/local/bin/mosaic /opt-start && mv /opt/Mosaic /opt-start

# Expose the default portonly 39876 is nessecary for admin access 
EXPOSE 22 39876 8100

# set Directories
VOLUME ["/opt/Mosiac","/usr/local/bin/mosaic", "/recordings"]

# Startup
ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c", "/etc/supervisor/conf.d/supervisord.conf"]
