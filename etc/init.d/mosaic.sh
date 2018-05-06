#!/bin/bash

chmod -R 777 /opt/Mosaic
chmod -R 777 /usr/local/bin/mosaic
chmod -R 777 /opt-start/Mosaiv
chmod -R 777 /opt-start/mosaic

# Prepare DVBLink bin
if [ -z "`ls /usr/local/bin/mosaic --hide='lost+found'`" ]
then
	cp -R /opt-start/mosaic/* /usr/local/bin/mosaic
fi
if [ ! -f "/usr/local/bin/mosaic/start.sh" ]
then
	cp -Rn /opt-start/mosaic/* /usr/local/bin/mosaic/
fi

# Prepare DVBLink bin
if [ -z "`ls /opt/Mosaic --hide='lost+found'`" ]
then
	cp -R /opt-start/Mosaic/* /opt/Mosaic
fi
if [ ! -f "/opt/Mosaic/data/database/dlrecorder.db" ]
then
	cp -Rn /opt-start/Mosaic/* /opt/Mosaic/
fi

# Start
/usr/local/bin/mosaic/start.sh
bash

else
echo "Install Wrong! Please Check Image or Path Config!"
sleep 60
fi
