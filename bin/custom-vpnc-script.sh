#!/bin/sh

# this effectively disables changes to /etc/resolv.conf
#INTERNAL_IP4_DNS=
##
### split networking
#CISCO_SPLIT_INC=1
#CISCO_SPLIT_INC_0_ADDR=10.62.0.0
#CISCO_SPLIT_INC_0_MASK=255.255.0.0
#CISCO_SPLIT_INC_0_MASKLEN=16
#CISCO_SPLIT_INC_0_PROTOCOL=0
#CISCO_SPLIT_INC_0_SPORT=0
#CISCO_SPLIT_INC_0_DPORT=0


set -x

env | grep PROPAG_ | cut -c8- > /tmp/env_propagate.properties
set -o allexport
. /tmp/env_propagate.properties
set +o allexport
rm -f /tmp/env_propagate.properties
env

. /etc/vpnc/vpnc-script
