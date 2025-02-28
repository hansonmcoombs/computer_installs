
# positonal args :
gitname=$1
gitemail=$2

echo "Starting installs"
echo "parameters:"
echo "gitname: $gitname"
echo "gitemail: $gitemail"

# update and upgrade
sudo apt update
sudo apt upgrade
sudo apt install openssh-server


source ~/.bashrc
conda config --prepend channels conda-forge

# pycharm
sudo snap install pycharm-community --classic
sudo snap install pycharm-professional --classic

# draw.io
sudo snap install drawio

# zoom
sudo snap install zoom-client

# install modflow
cd "$(dirname "$0")"
bash support_files/install_modflow.sh

# install and compile pest
bash support_files/compile_pest/compile_pest.sh


# set tmux config
echo "set -g mouse on" >> ~/.tmux.conf
echo "set -g history-limit 5000" >> ~/.tmux.conf

# set up git
git config --global user.name  $gitname
git config --global user.email $gitemail

# manage .bashrc as git
cd ~
git init
git add ~/.bashrc
git commit -m "Added .bashrc to version control"

# tmux logging
git clone https://github.com/tmux-plugins/tmux-logging ~/.tmux/tmux-logging
echo "run-shell ~/.tmux/tmux-logging/logging.tmux" >> ~/.tmux.conf

# hack to auto log
# ensure wd is correct
cd "$(dirname "$0")"
echo "changing cd to $(dirname "$0")"
cp support_files/variables.sh ~/.tmux/tmux-logging/scripts/variables.sh
# change: filename_suffix="#{session_name}-#{window_index}-#{pane_index}-%Y%m%dT%H%M%S.log" --> filename_suffix="#{session_name}-#{window_index}-#{pane_index}.log"

cp support_files/.ensure_tmux_logging_on.sh ~/.tmux/tmux-logging/scripts/.ensure_tmux_logging_on.sh
# change: from ~/.tmux/tmux-logging/scripts/toggle_logging.sh
#
# toggle_pipe_pane() {
#        if is_logging; then
#                echo 'tmux already logging'
#                # set_logging_variable "not logging"
#                # stop_pipe_pane
#        else
#                set_logging_variable "logging"
#                start_pipe_pane
#        fi
# }

chmod +x  ~/.tmux/tmux-logging/scripts/.ensure_tmux_logging_on.sh
echo "~/.tmux/tmux-logging/scripts/.ensure_tmux_logging_on.sh" >> ~/.bashrc
source ~/.bashrc

# handle the matplotlib problem: https://komanawa.atlassian.net/wiki/spaces/PT/pages/1047232531/Python#Python-on-linux-challenges%3A
mkdir ~/.config/matplotlib
echo "backend: TkAgg" >> ~/.config/matplotlib/matplotlibrc

# commit .bashrc as git
cd ~
git commit -m "finished normal installs"

# install Zotero
wget -qO- https://raw.githubusercontent.com/retorquere/zotero-deb/master/install.sh | sudo bash
sudo apt update
sudo apt install zotero


echo "Finished installs"
