echo "virtualnetwork setup start"
VBoxManage hostonlyif remove vboxnet0

VBoxManage hostonlyif create

VBoxManage hostonlyif ipconfig vboxnet0 --ip 192.168.56.1

VBoxManage dhcpserver add --ifname vboxnet0 --ip 192.168.56.100 --netmask 255.255.255.0 --lowerip 192.168.56.101 --upperip 192.168.56.254

VBoxManage dhcpserver modify --ifname vboxnet0 --enable

vboxmanage modifyvm cuckoo2 --hostonlyadapter1 vboxnet0
echo "virtualnetwork setup complete"
