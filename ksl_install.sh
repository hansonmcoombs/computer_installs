
# before running set:
# gitname =
# gitemail =

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
source .bashrc
conda config --prepend channels conda-forge

# pycharm
sudo snap install pycharm-community --classic
# zoom
sudo snap install zoom-client

### Config Options ###
# change default programs #
# todo qimgv --> for images

# todo add to auto start
# flame shot

# todo configure panel to match mine
#

#  todo keyboard Shortcuts
# set shortcut for xflock4 to ctrl+alt+shift+l (to allow pycharm refactor)
# map ctrl + alt + delete to xfce4-taskmanager
# todo shortcut for pasting from selection clipboard



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
cd cd "$(dirname "$0")"
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
echo "backend: TkAgg" >> ~/.config/matplotlib/matplotlibrc

# commit .bashrc as git
cd ~
git commit -m "finished normal installs"