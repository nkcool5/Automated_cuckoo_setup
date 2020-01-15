echo "==================================================================================="
echo "				      ADD CUCKOO USER 					 "
echo "==================================================================================="
echo "Enter Username To Create New User For Cuckoo Installation"
read username
sudo adduser $username
sudo usermod -aG sudo $username
echo "==================================="
echo ""
