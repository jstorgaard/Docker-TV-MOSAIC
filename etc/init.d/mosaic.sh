#!/bin/bash

chmod -R 777 /opt/TVMosaic
chmod -R 777 /usr/local/bin/tvmosaic
chmod -R 777 /opt-start/TVMosaic
chmod -R 777 /opt-start/tvmosaic


if [ -z "`ls /usr/local/bin/tvmosaic --hide='lost+found'`" ]
then
    cp -R /opt-start/tvmosaic/* /usr/local/bin/tvmosaic
fi
if [ ! -f "/usr/local/bin/tvmosaic/start.sh" ]
then
    cp -Rn /opt-start/tvmosaic/* /usr/local/bin/tvmosaic/
fi

if [ -z "`ls /opt/TVMosaic --hide='lost+found'`" ]
then
    cp -R /opt-start/TVMosaic/* /opt/TVMosaic
fi
if [ ! -f "/opt/TVMosaic/recorder_database/recorder_database.db" ]
then
    cp -Rn /opt-start/TVMosaic/* /opt/TVMosaic/
fi

/usr/local/bin/tvmosaic/start.sh
bash

else
echo "Install Wrong! Please Check Image or Path Config!"
sleep 60
fi
