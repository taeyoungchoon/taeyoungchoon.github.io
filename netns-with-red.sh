echo 1 > /proc/sys/net/ipv4/ip_forward

ip netns add red

ip link add veth0 type veth peer name veth1
ip link set veth1 netns red
ip netns exec red ip addr add 192.168.33.201/24 dev veth1
ip netns exec red ip link set dev veth1 up
ip netns exec red ip route add default via 192.168.33.1

ip link set dev veth0 up

# make bridge device
ip link add br0 type bridge
ip link set dev br0 up
ip link set dev enp1s0 master br0
ip link set dev veth0 master br0

# make check
ip netns exec red ip -4 a
ip netns exec red ip r
ip netns exec red ping -c 3 192.168.33.1

# make clean
ip link del veth0
ip netns del red
ip link del br0

