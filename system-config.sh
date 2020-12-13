# link for configuring zsh :
# https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156/
GIT_DIR="$HOME/git"
ZSH_CONFIG_FILE="$HOME/.zshrc"
VIM_CONFIG_FILE="$HOME/.vimrc"
OMZ_HOME="$HOME/.oh-my-zsh"

xcode-select —-install

# install and configure hombebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update

# install & update zsh
brew install zsh
omz update
echo 'export HOMEBREW_NO_AUTO_UPDATE=1' >> $ZSH_CONFIG_FILE
echo 'export PATH="/usr/local/sbin:$PATH"' >> $ZSH_CONFIG_FILE
git clone https://github.com/bhilburn/powerlevel9k.git $OMZ_HOME/custom/themes/powerlevel9k
echo ZSH_THEME="powerlevel9k/powerlevel9k" >> $ZSH_CONFIG_FILE

# install git & edit gitconfig
brew install git \
&& echo 'export PATH="/usr/local/opt/git/bin"' >> $ZSH_CONFIG_FILE
git config --global user.name "Matthieu Audemard"
git config --global user.email "matthieu.audemard@gmail.com"
git config --global core.editor vim
git config --global credential.helper osxkeychain

brew install wget

# add brew repos
brew tap homebrew/cask-fonts
brew tap mongodb/brew

# Web browsers
brew install --cask \
    homebrew/cask-versions/firefox-developer-edition \
    google-chrome \

# Social networks & comm
brew install --cask \
    discord \
    skype \
    whatsapp \

# Develpt
brew install --cask \
    atom \
    jetbrains-toolbox \
    intellij-idea \
    phpstorm \
    robo-3t

# atom configuration
apm install dracula-ui dracula-syntax atom-beautify

# Security
brew install --cask \
    1password \
    expressvpn \
    malwarebytes

# Utility & others
brew install --cask \
    appcleaner \
    battle-net \
    gimp \
    postman \
    steam \
    transmission \
    font-inconsolata-for-powerline \
    iina \
    notion

# install & configure vim
brew install vim
echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> $ZSH_CONFIG_FILE
mkdir $GIT_DIR
git clone https://github.com/dracula/vim.git `$GIT_DIR/dracula-vim`
mkdir -p ~/.vim/pack/themes/start
ln -s `$GIT_DIR/dracula-vim` ~/.vim/pack/themes/start/dracula
touch $VIM_CONFIG_FILE
echo 'packadd! dracula' >> $VIM_CONFIG_FILE
echo 'syntax enable' >> $VIM_CONFIG_FILE
echo 'colorscheme dracula' >> $VIM_CONFIG_FILE


# install & configure java11
brew install java11
echo 'export PATH="/usr/local/opt/openjdk@11/bin:$PATH"' >> $ZSH_CONFIG_FILE
sudo ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk

# install & configure php7.3 + xdebug
brew install php@7.3
echo 'export PATH="/usr/local/opt/php@7.3/bin:$PATH"' >> $ZSH_CONFIG_FILE
echo 'export PATH="/usr/local/opt/php@7.3/sbin:$PATH"' >> $ZSH_CONFIG_FILE
pecl install xdebug

# install & configure mysql@5.7
brew install mysql@5.7
echo 'export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"' >> $ZSH_CONFIG_FILE

# install mongodb
brew install mongodb-community
echo 'export PATH="/usr/local/Cellar/mongodb-community/4.4.1/bin:$PATH"' >> $ZSH_CONFIG_FILE

brew install \
    maven \
    ffmpeg \
    python@3.9 \
    youtube-dl \
    composer

# install @ configure node
brew install node@12
echo 'export PATH="/usr/local/opt/node@12/bin:$PATH"' >> $ZSH_CONFIG_FILE

brew doctor
brew cleanup

npm install -g @angular/cli@10
