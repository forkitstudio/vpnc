set -x
set -m

route -n

/usr/sbin/vpnc default --auth-mode psk --no-detach --non-inter --local-port 0 --debug 2 &
sleep 7

echo "Current route table: "
route -n 

fg %1