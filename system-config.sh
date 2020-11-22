# link for configuring zsh :
# https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156/

xcode-select —-install

# install and configure hombebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update

# install & update zsh
brew install zsh
omz update
echo 'export HOMEBREW_NO_AUTO_UPDATE=1' >> ~/.zshrc  # disable brew formulas auto updates
echo 'export PATH="/usr/local/sbin:$PATH"' >> ~/.zshrc

# install git & edit gitconfig
brew install git
echo 'export PATH="/usr/local/opt/git/bin"' >> ~/.zshrc
git config --global user.name "Matthieu Audemard"
git config --global user.email "matthieu.audemard@gmail.com"
git config --global core.editor vim
git config --global credential.helper osxkeychain

# add brew repos
brew tap homebrew/cask-fonts
brew tap mongodb/brew

# Web browsers
brew cask install \
    homebrew/cask-versions/firefox-developer-edition \
    google-chrome \

# Social networks & comm
brew cask install \
    discord \
    skype \
    whatsapp \

# Develpt
brew cask install \
    atom \
    jetbrains-toolbox \
    intellij-idea \
    phpstorm \
    robo-3t

# atom configuration
apm install dracula-ui dracula-syntax atom-beautify

# Security
brew cask install \
    1password \
    expressvpn \
    malwarebytes

# Utility & others
brew cask install \
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
echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.zshrc
git clone https://github.com/dracula/vim.git ~/git/dracula-vim
mkdir -p ~/.vim/pack/themes/start
ln -s ~/git/dracula-vim ~/.vim/pack/themes/start/dracula
touch ~/.vimrc
echo 'packadd! dracula' >> ~/.vimrc
echo 'syntax enable' >> ~/.vimrc
echo 'colorscheme dracula' >> ~/.vimrc


# install & configure java11
brew install java11
echo 'export PATH="/usr/local/opt/openjdk@11/bin:$PATH"' >> ~/.zshrc
sudo ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk

# install & configure php7.3 + xdebug
brew install php@7.3
echo 'export PATH="/usr/local/opt/php@7.3/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/usr/local/opt/php@7.3/sbin:$PATH"' >> ~/.zshrc
pecl install xdebug

# install & configure mysql@5.7
brew install mysql@5.7
echo 'export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"' >> ~/.zshrc

# install mongodb
brew install mongodb-community
echo 'export PATH="/usr/local/Cellar/mongodb-community/4.4.1/bin:$PATH"' >> ~/.zshrc

brew install \
    maven \
    ffmpeg \
    python \
    node \
    youtube-dl \
    composer

brew doctor
brew cleanup

npm install -g @angular/cli@10
