$dir="~/thirdSrc"
mkdir -p $dir
cd $dir
#install zsh
sudo apt-get install zsh
#install ohmyzsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
#install solarized color for zsh
git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized && ./instal.sh
cd ..
#install powerline theme for ohmyzsh
git clone https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git
cp oh-my-zsh-powerline-theme/powerline.zsh-theme ~/.oh-my-zsh/themes/
#patch fonts for ohmyzsh
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
#TODO
