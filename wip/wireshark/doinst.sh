#!/bin/sh
getent group wireshark >/dev/null 2>&1 || usr/sbin/groupadd -g 150 wireshark &>/dev/null
setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' usr/bin/dumpcap
