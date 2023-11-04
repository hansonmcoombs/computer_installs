
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

# Install  #
# miniconda check version here: https://docs.conda.io/en/latest/miniconda.html#linux-installers
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

sleep 10

source ~/.bashrc
conda config --prepend channels conda-forge

# install modflow
echo 'export PATH="$PATH:/bin/modflow"' >>~/.bashrc
echo 'export PATH="$PATH:/bin/modflow"' >>~/.profile
source ~/.bashrc
source ~/.profile


# add pest to path
echo 'export PATH="$PATH:/bin/pest"' >>~/.bashrc
source ~/.bashrc


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

echo "Finished installs"