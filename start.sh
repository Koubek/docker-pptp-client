#!/bin/sh

if [ -z "$VPNADDR" -o -z "$VPNUSER" -o -z "$VPNPASS" -o -z "$VPNRDPIP" ]; then
  echo "Variables VPNRDPIP, VPNADDR, VPNUSER and VPNPASS must be set."; exit;
fi

iptables -t nat -A PREROUTING -p tcp --dport 3380 -j DNAT --to-destination  ${VPNRDPIP}:3389
iptables -t nat -A POSTROUTING -j MASQUERADE

# Setup masquerade, to allow using the container as a gateway
for iface in $(ip a | grep eth | grep inet | awk '{print $2}'); do
  iptables -t nat -A POSTROUTING -s "$iface" -j MASQUERADE
done

# TODO: Activate the following line once added the file.
# /gateway-fix.sh &

while [ true ]; do
  echo "------------ VPN Starts ------------"
  # run vpn and check connection
  echo "------------ VPN exited ------------"
  sleep 10
done
