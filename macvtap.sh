#!/bin/sh

IFNAME=$1
MACVTAP_NAME=$2
MACVTAP_MAC=$3
ip link del ${MACVTAP_NAME}
ip link add link ${IFNAME} name ${MACVTAP_NAME} type macvtap mode bridge
ip link set ${MACVTAP_NAME} address ${MACVTAP_MAC} up
