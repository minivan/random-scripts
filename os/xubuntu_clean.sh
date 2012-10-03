sudo apt-get install zsh git-core vim curl zlib1g-dev build-essential ruby-rvm

#setup the terminal theme to solarized light
mkdir .config/Terminal
curl https://raw.github.com/sgerrand/xfce4-terminal-colors-solarized/master/light/terminalrc > .config/Terminal/terminalrc 

#download and install the inconsolata font
mkdir -p ~/.fonts/monospace
curl http://levien.com/type/myfonts/Inconsolata.otf > .fonts/monospace/Inconsolata.otf
#set it as the primary font for the xfce4-terminal
echo "FontName=Inconsolata Medium 14" >> .config/Terminal/terminalrc

#install oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh


# personal stuff:
# 1. clone my .dotfiles
git clone git://github.com/minivan/dotfiles.git
# 2. create symlink for .vimrc
ln -s ~/.dotfiles/.vimrc ~/.vimrc
# 3. create symlink for .zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc

#create a .dotfiles directory for all the dotfiles
mkdir -p ~/.dotfiles/.vim
#symlink .dotfiles/.vim to .vim
ln -s .dotfiles/.vim ~/.vim

#install pathogen into .dotfiles/vim
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
  curl -Sso ~/.vim/autoload/pathogen.vim \
  https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

#install the solarized color scheme
cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git

#install ctrl-p
cd !/.vim/bundle
git clone https://github.com/kien/ctrlp.vim.git

#configure git
git config --global user.name "Ivan Zarea"
git config --global user.email zarea.ion@gmail.com
git config --global core.editor "vim"




#change the shell to zsh
chsh -s `which zsh`

#reboot!
sudo shutdown -r now
