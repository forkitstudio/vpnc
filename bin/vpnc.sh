#!/bin/sh

set -x

cat > /etc/vpnc/default.conf <<EOF
IPSec gateway ${VPNC_GATEWAY}
IPSec ID ${VPNC_ID}
IPSec secret ${VPNC_SECRET}
Xauth username ${VPNC_USERNAME}
Xauth password ${VPNC_PASSWORD}
DPD idle timeout (our side) 300
Script /etc/service/vpnc/scripts/custom-vpnc-script.sh
EOF

if [ -z "$CUSTOMSCRIPT" ]
then
  echo "\$CUSTOMSCRIPT is empty"
  . /etc/service/vpnc/scripts/custom_cmd.sh
#  /usr/sbin/vpnc default --no-detach --non-inter --local-port 0
else 
  . ${CUSTOMSCRIPT}
fi