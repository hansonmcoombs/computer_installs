gitname=$1
gitemail=$2

echo "Starting miniconda install"
echo "parameters:"
echo "gitname: $gitname"
echo "gitemail: $gitemail"


# update and upgrade
sudo apt update
sudo apt upgrade

# Install  #
# miniconda check version here: https://docs.conda.io/en/latest/miniconda.html#linux-installers
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

echo "Restart terminal to allow conda to be recognized"
