FROM alpine:3.12 as release
LABEL maintainer="Fork IT Studio - https://github.com/forkitstudio"

RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    vpnc curl net-tools

# Alpine specific: check if nsswitch.conf exists and enable host names resolution via /etc/hosts
RUN [ ! -e /etc/nsswitch.conf ] && echo 'hosts: files dns' > /etc/nsswitch.conf

# Setup vpnc service & scripts
RUN mkdir -p /etc/service/vpnc/scripts
COPY bin/vpnc.sh /etc/service/vpnc/run
COPY bin/custom_cmd.sh bin/custom-vpnc-script.sh /etc/service/vpnc/scripts/
RUN chmod 500 /etc/service/vpnc/run \
    /etc/service/vpnc/scripts/custom_cmd.sh \
    /etc/service/vpnc/scripts/custom-vpnc-script.sh

CMD ["/etc/service/vpnc/run"]
