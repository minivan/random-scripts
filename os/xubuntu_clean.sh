sudo apt-get install -y zsh git-core vim curl zlib1g-dev build-essential openjdk-6-jdk openjdk-6-jre tmux \
openssl libreadline6 libreadline6-dev git-core libssl-dev libyaml-dev \
libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev \
automake libtool bison subversion git nodejs xfce4-terminal


# setup the terminal theme to solarized light
mkdir .config/Terminal
curl https://raw.github.com/sgerrand/xfce4-terminal-colors-solarized/master/light/terminalrc > .config/Terminal/terminalrc 

# download and install the inconsolata font (using the appropriate patched version for the vim powerline)
mkdir -p ~/.fonts/monospace
curl https://gist.github.com/raw/1595572/51bdd743cc1cc551c49457fe1503061b9404183f/Inconsolata-dz-Powerline.otf > .fonts/monospace/Inconsolata.otf

# set it as the primary font for the xfce4-terminal
echo "FontName=Inconsolata Medium 14" >> .config/Terminal/terminalrc

# install oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# ==========THEME===========
# create the .themes folder
mkdir -p ~/.themes
# get the window decorations
curl http://xfce-look.org/CONTENT/content-files/87476-darksun-xfce4.tar.bz2 > ~/.themes/window_dec.tar.bz2
cd ~/.themes
tar xjvf window.tar.bz2
# clean up
rm window.tar.bz2
# now replace the default theme name from ~/.config/xfce4/xfconf/xfce-perchannel-xml to Darksun




# personal stuff:
# 1. clone my .dotfiles
git clone --recursive git://github.com/minivan/.dotfiles.git
# 2. create symlink for .vimrc
ln -s ~/.dotfiles/.vimrc ~/.vimrc
# 3. create symlink for .zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc


#configure git
git config --global user.name "Ivan Zarea"
git config --global user.email zarea.ion@gmail.com
git config --global core.editor "vim"

#install rvm
curl -L https://get.rvm.io | zsh

#let's use the heroku toolbelt!
wget -qO- https://toolbelt.heroku.com/install.sh | sh

#change the shell to zsh
chsh -s `which zsh`

#reboot!
sudo shutdown -r now
