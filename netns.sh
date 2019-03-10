#!/bin/sh

set -x

IF_NAME=$1 shift
NETNS_NAME=$1 shift

# Add a new namespace called test_ns
#ip netns del ${NETNS_NAME}
ip netns add ${NETNS_NAME}

# Set test to use eth0, after this point eth0 is not usable by programs
# outside the namespace
ip link set ${IF_NAME} netns ${NETNS_NAME}

# Bring up eth0 inside test_ns
ip netns exec ${NETNS_NAME} ip link set ${IF_NAME} up

# Use dhcp to get an ipv4 address for eth0
ip netns exec ${NETNS_NAME} dhclient ${IF_NAME}

ip netns exec ${NETNS_NAME} ip addr list
ip netns exec ${NETNS_NAME} $@
