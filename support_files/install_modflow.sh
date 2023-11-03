# download and install MODFLOW executables
wget -O ~/Downloads/linux.zip https://github.com/MODFLOW-USGS/executables/releases/latest/download/linux.zip

cd ~/Downloads
unzip linux.zip -d linux_modflow
sudo mkdir -p /bin/modflow
sudo cp -r linux_modflow/* /bin/modflow
sudo chmod +x /bin/modflow/*
rm -rf linux_modflow
rm linux.zip

cd ~

#  add bin to file
echo 'export PATH="$PATH:/bin/modflow"' >>~/.bashrc
echo 'export PATH="$PATH:/bin/modflow"' >>~/.profile
source ~/.bashrc
source ~/.profile

