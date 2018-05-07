# Docker TV MOSAIC DVB Software

TV MOSAIC offers everything you need to enjoy your favorite Satellite (DVB-S/S2), Cable (DVB-C and QAM), Terrestrial (DVB-T/T2 and ATSC), IPTV and Analog TV channels and recordings within your home network and on the go!

Record your favorite TV programs in original quality directly to the local hard disk of your NAS, PC, Mac or Raspberry Pi

Watch live and recorded TV on your mobile devices with free TV MOSAIC apps for iOS and Android

Live and recorded TV for Windows, Linux and Mac laptops and workstations

Enjoy your favorite programs on all TV screens in house with Kodi and DLNA clients

## Volumes

TV MOSAIC is quite locked down, directory-wise. Currently only `/share` and `/recordings` are used.

Everything else is splitted up by TV MOSAIC to different files.

Currently the volumes are:

* `/recordings` - Recordings folder. You might have to point it here. **Required**
* `/opt/Mosaic` - Where all xmltv, transponders, playlists etc is located. **Required**
* `/usr/local/bin/tvmosaic` - Config folder. **Required**

## Ports

It's recommended to run the docker with `--net=host` to be able to use IPTV without issues.

* `9070` - TV MOSAIC port.
* `9071` - TV MOSAIC port.

## Info

Read more at http://http://tv-mosaic.com
