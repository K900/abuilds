#!/bin/bash
getent group lightdm >/dev/null 2>&1 || groupadd -g 620 lightdm
if getent passwd lightdm > /dev/null 2>&1; then
	usr/sbin/usermod -d /var/lib/lightdm -c 'LightDM' -s /sbin/nologin lightdm > /dev/null 2>&1
else
	usr/sbin/useradd -c 'LightDM' -u 620 -g lightdm -d /var/lib/lightdm -s /sbin/nologin lightdm
fi
passwd -l lightdm > /dev/null
chown -R lightdm:lightdm /var/lib/lightdm > /dev/null
chmod a+r /var/lib/lightdm/
chmod +r /etc/lightdm/lightdm.conf


