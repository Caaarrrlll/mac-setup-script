# install homebrew
echo "\e[92mInstalling Homebrew\e[39m"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "\e[92mInstalling Git\e[39m"
brew install git
echo "\e[92mInstalling wget\e[39m"
brew install wget
echo "\e[92mInstalling NodeJS\e[39m"
brew install node
echo "\e[92mInstalling Angular & NestJS CLI\e[39m"
npm install -g @angular/cli @nestjs/cli
echo "\e[92mInstalling Python\e[39m"
# Test this
sed  '/export PATH="//usr/local/opt/python/libexec/bin:' ./zshrc
brew install python
echo "\e[92mMake Dev Folder\e[39m"
mkdir ~/Development
# echo "\e[92mInstall Flutter\e[39m"
# git clone https://github.com/flutter/flutter.git ~/Development
# export PATH="$PATH:`~/Development/flutter/bin"