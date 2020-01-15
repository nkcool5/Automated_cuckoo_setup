# Automated_cuckoo_setup

Recommended Host Machine : Ubuntu 18.04 LTS 

Guest Machine for virtual box: Pre-Configured for Cuckoo Windows 7 32 bit

All the below steps are to be executed on host machine.

Step-1: Download the .zip folder from the link: https://drive.google.com/file/d/15FviQMVSIh3cnNurVIFdI3Rsl9i8O4_Z/view?usp=sharing

Step-2: Unzip it and copy the scripts cuckoo_framework_install.sh and virtualnetwork.sh in the unzipped folder named Cuckoo_Setup

Step-3: If you want to setup Cuckoo in a new user then run the script createuser.sh else you can install Cuckoo in your working user also. 

Step-4: Run cuckoo_framework_install.sh script in the Cuckoo_Setup folder and it will install automatically all the dependancies needed for Cuckoo Setup. This script will also import the .ova file (which is a pre-configured guest machine). The script will itself replace the configuration file of Cuckoo with a new configuration file needed for the set up.

Step-5:Finally, you have to go to the virtual box and power on the Cuckoo2 machine. Find the IP, using the ipconfig command from cmd terminal. If you find the IP address as "192.168.56.101" then close the terminal and take a snapshot of virtual machine and keep the name of this snapshot as "Snapshot 1"  because the configuration file has the same name. To take snapshot go to the machine tab in virtualbox and click "Take snapshot". Power off the machine, and your Cuckoo set up is complete.





