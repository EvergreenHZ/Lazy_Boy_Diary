# How to Check All Interfaces
ip a

# How to Assign a IP Address to Specific Interface
sudo ip addr add xx.xx.xx.xx dev <interface>

# How to Check an IP Address
ip show addr show

# How to Enable/Disable Network Interface
sudo ip link set <interface> up

# How do I Check Route Table
ip route show

# How do I Add Static Route
ip route add 10.10.20.0/24 via 192.168.50.100 dev eth0

# How to Remove Static Route
ip route del 10.10.20.0/24

# How do I Add Default Gateway
ip route add default via 192.168.50.100
