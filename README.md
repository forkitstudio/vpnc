# vpnc
Cisco vpn client

## Build
```
docker build -t forkitstudio/vpnc .
```
## Environment Variables

- `VPNC_GATEWAY`: IP/name of your IPSec gateway
- `VPNC_ID`: Group name
- `VPNC_SECRET`: Group password
- `VPNC_USERNAME`: XAUTH username
- `VPNC_PASSWORD`: XAUTH password
- `CUSTOMSCRIPT`: path to custom script, that you need to mount.
- `PROPAG_***`: variables to be propagated to the vpnc-script scope. Can be used for split tunneling, for example:
    - `PROPAG_INTERNAL_IP4_DNS` will be passed as `INTERNAL_IP4_DNS` 
    - `PROPAG_CISCO_SPLIT_INC` will be passed as `CISCO_SPLIT_INC`
    - `PROPAG_CISCO_SPLIT_INC_0_ADDR` will be passed as `CISCO_SPLIT_INC_0_ADDR`
    - `PROPAG_CISCO_SPLIT_INC_0_MASK` will be passed as `CISCO_SPLIT_INC_0_MASK`
    - `PROPAG_CISCO_SPLIT_INC_0_MASKLEN` will be passed as `CISCO_SPLIT_INC_0_MASKLEN`
    - `PROPAG_CISCO_SPLIT_INC_0_PROTOCOL` will be passed as `CISCO_SPLIT_INC_0_PROTOCOL`
    - `PROPAG_CISCO_SPLIT_INC_0_SPORT` will be passed as `CISCO_SPLIT_INC_0_SPORT`
    - `PROPAG_CISCO_SPLIT_INC_0_DPORT` will be passed as `CISCO_SPLIT_INC_0_DPORT` 

## Example
```bash
docker run -d --privileged=true --name vpn --restart always \
    -e "VPNC_GATEWAY=1.1.1.1" \
    -e "VPNC_PASSWORD=sdfadsdf" \
    -e "VPNC_ID=vpn-id" \
    -e "VPNC_SECRET=asdfasdf" \
    -e "VPNC_USERNAME=myuser" forkitstudio/vpnc
```
