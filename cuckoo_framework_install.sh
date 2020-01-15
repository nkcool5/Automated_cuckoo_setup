echo "====================================="
#System update
sudo apt-get update
echo "update done"

echo "====================================="
#Virtualbox installation
sudo apt install virtualbox-qt -y
echo "Virtualbox install done"

echo "====================================="
# import preconfigured virtual machine and remove shared folder if any setup previously
sudo chmod 777 cuckoo2.ova

vboxmanage import cuckoo2.ova
vboxmanage sharedfolder remove "cuckoo2" -name "shared"
echo "import cuckoo2 image on virtualbox done"

echo "====================================="
# Python installation because Cuckoo  host  components  are  completely  written  in  Python,  therefore  it  is  required  to  have  an appropriate version of Python installed.
sudo apt-get install python -y
echo "python install done "

echo "====================================="
# python-pip is needed to install python library
sudo apt-get install python-pip -y
echo "python-pip install done "

echo "====================================="
# git is needed to download volatility repository
sudo apt-get install git -y
echo "git install done "

echo "====================================="
# python-dev contains the header files you need to build Python extensions cuckoo needs it for web and api development
sudo apt-get install python-dev -y
echo "python-dev install done "

echo "====================================="
# libffi-dev package contains the headers and static library files necessary for building programs which use libffi
sudo apt-get install libffi-dev -y
echo "libffi-dev install done "

echo "====================================="
# dependency of M2Crypto which cuckoo using for some certificate stuff.
sudo apt-get install libssl-dev -y
echo "libssl-dev install done "

echo "====================================="
# setuptools is used for packaging python projects in setup.py It tells setuptools about the package (such as the name and version) as well as which code files to include.
sudo apt-get install python-setuptools -y
echo "python-setuptools install done "

echo "====================================="
# The build-essential package is a reference for all the packages needed to compile a Debian package. It generally includes the GCC/g++ compilers and libraries
sudo apt-get install build-essential -y
echo "build-essential install done "

echo "====================================="
# Libjpeg is a widely used C library for reading and writing JPEG image files
sudo apt-get install libjpeg-dev -y
echo "libjpeg-dev install done "

echo "====================================="
# zlib is a library implementing the deflate compression method found in gzip and PKZIP.
sudo apt-get install zlib1g-dev -y
echo "zlib1g-dev install done "

echo "====================================="
# Dependency of Mcrypto
sudo apt-get install swig -y
echo "swig install done "

echo "====================================="
# In order to use the Django-based Web Interface, MongoDB is required 
sudo apt-get install mongodb -y
echo "mongodb install done "

echo "====================================="
# In order to use PostgreSQL as database (cuckoo recommendation), PostgreSQL and libpq-dev will have to be installed 
sudo apt-get install postgresql -y
echo "postgresql install done "

echo "====================================="

sudo apt-get install libpq-dev -y
echo "libpq-dev install done "

echo "====================================="
# nstall tcpdump in order to dump network traffic which occurs during analysis
sudo apt-get install tcpdump -y
echo "tcpdump install done "

echo "====================================="
#  AppArmor is security Linux kernel module. If you are using Ubuntu, make sure to disable AppArmor otherwise you will not get correct output of tcpdump.
sudo apt-get install apparmor-utils -y
echo "apparmor-utils install done "

echo "====================================="

sudo aa-disable /usr/sbin/tcpdump
echo "apparmor security profile disable done "

echo "====================================="

# if you don't have setcap installed, you should install this library
sudo apt-get install libcap2-bin -y
echo "libcap2-bin install done "

echo "====================================="

# if you want to run the tcpdump, you need root privileges; but since you don't want Cuckoo to run as root, you'll have to set specific Linux capabilities to the binary,
sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump
echo "set file capabilities done "

echo "====================================="
# you will need to configure IP forwarding so an internet connection gets routed from the host machine to the guest VM
# -A add rule Postrouting: packet about to go out  -o output interface
sudo iptables -t nat -A POSTROUTING -o eth0 -s 192.168.56.0/24 -j MASQUERADE
# add rule to nat table that The rule uses the NAT packet matching table (-t nat) and specifies the built-in POSTROUTING chain for NAT (-A POSTROUTING) on the firewall's external networking device (-o eth0). POSTROUTING allows packets to be altered as they are leaving the firewall's external device. The -j MASQUERADE target is specified to mask the private IP address of a node with the external IP address of the firewall/gateway . The -s specify the source address .
echo "MASQUERADE done "

echo "====================================="
# Default drop
sudo iptables -P FORWARD DROP
echo "FORWARD DROP done "

echo "====================================="
# add rule only related and established state accept: ESTABLISHED meaning that the packet is associated with a connection, ELATED  meaning  that  the  packet  is  starting  a  new connection,  but  is  associated  with an existing connection,
sudo iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
echo "ESTABLISHED -j ACCEPT done "

echo "====================================="
# access internet
sudo iptables -A FORWARD -s 192.168.56.0/24 -j ACCEPT
echo "iptables -A FORWARD -s 192.168.56.0/24 -j ACCEPT done "

echo "====================================="
# access intranet
sudo iptables -A FORWARD -s 192.168.56.0/24 -d 192.168.56.0/24 -j ACCEPT
echo "iptables -A FORWARD -s 192.168.56.0/24 -d 192.168.56.0/24 -j ACCEPT done "

echo "====================================="

# enable IP forwarding in the kernel so that these settings are set to Active
echo 1 | sudo tee -a /proc/sys/net/ipv4/ip_forward
echo "sudo tee -a /proc/sys/net/ipv4/ip_forward done "

echo "====================================="

sudo sysctl -w net.ipv4.ip_forward=1
echo "sysctl -w net.ipv4.ip_forward=1 done "

echo "====================================="

# download volatility
sudo git clone https://github.com/volatilityfoundation/volatility.git
echo "volatility tool download done "

echo "====================================="
# pcregrep searches files for character patterns, in the same way as other grep commands do,
sudo apt-get install pcregrep -y
echo "pcregrep install done "

echo "====================================="
# optional C++ wrapper-class for the library PCRE (Perl Compatible Regular Expressions)
sudo apt-get install libpcre++-dev -y
echo "libpcre++-dev install done "

echo "====================================="
# The goal of diStorm3 is to decode x86/AMD64 binary streams and return a structure that describes each instruction
sudo pip install distorm3
echo "distorm3 install done "

echo "====================================="
# YARA rules are a way of identifying malware (or other files) by creating rules that look for certain characteristics.
sudo pip install yara
echo "yara install done "

echo "====================================="
#This is a collection of both secure hash functions (such as SHA256 and RIPEMD160), and various encryption algorithms cuckoo uses to check the encryption algorithm used by malware
sudo pip install pycrypto
echo "pycrypto install done "

echo "====================================="
# To capture the screenshots
sudo apt-get install python-pil -y
echo "python-pil install done "

echo "====================================="
#openpyxl is a Python library to read/write Excel 2010 xlsx/xlsm/xltx/xltm files
sudo pip install OpenPyxl
echo "OpenPyxl install done "

echo "====================================="

sudo pip install ujson
echo "ujson install done "

echo "====================================="

cd volatility
sudo python setup.py install
echo "volatility install done "

echo "====================================="

sudo pip install simplejson
echo "simplejson install done "

echo "====================================="

sudo pip install pandas==0.22
echo "pandas install done "

echo "====================================="

sudo pip install numpy
echo "numpy install done "

echo "====================================="
# For certificate stuff
sudo pip install m2crypto
echo "m2crypto install done "

echo "====================================="

sudo pip uninstall yara -y
echo "yara uninstall done "

echo "====================================="

sudo pip install cryptography==2.3

echo "====================================="

sudo pip install cuckoo
echo "cuckoo install done" 

user=`whoami`
sudo chmod -R 777 /home/$user/.cache/

echo "====================================="

cd ..
sh virtualnetwork.sh
cuckoo &
sleep 8s
killall -s 9 cuckoo

rm -r /home/$user/.cuckoo/conf
cp -r conf /home/$user/.cuckoo/
echo "cuckoo Setup complete"

echo "====================================="
