To setup the router for internal and external access to the cluster, the internal ip addresses should be static and the external ip should enable
port forwarding to allow for ssh into the cluster.

These directions are for a Netgear Genie - Nighthawk X6 R8000 - v 1.0.3.4_1.1.2

**Set up static IP addresses internally**

1. Advanced Tab
2. Setup
3. LAN Setup
4. Address Reservation Section: +Add
5. Enter the MAC Address and desired IP.
6. Repeat for all nodes
7. reboot the router and reboot all nodes

**Set up port forwarding**

1. Advanced Tab
2. Advanced Setup
3. Port Forwarding / Port Triggering
3. Select Port Forwarding
4. + Add Custom Service
5. Set a Service Name, Protocol:  TCP/UDP, External Port Range: XXXX, Uncheck "Use the same port", Internal Port Range: 22, Internal IP Address: 192.168.0.XXX
