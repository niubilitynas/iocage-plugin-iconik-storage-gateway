#!/bin/sh

sysrc -f /etc/rc.conf iconik_storage_gateway_enable="YES"

echo "Download Distfiles"
cd /root
fetch https://downloads.iconik.io/iconik_storage_gateway-latest.txz

pkg add /root/iconik_storage_gateway-latest.txz

# Enable iconik ui
echo "iconik_ui_enable=\"YES\"" >> /etc/rc.conf

#restart services
/usr/local/etc/rc.d/iconik_ui restart
/usr/local/etc/rc.d/iconik_storage_gateway restart

