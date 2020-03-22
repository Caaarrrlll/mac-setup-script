unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
echo ${machine}

case "${machine}" in
    Cygwin*)  echo "Not setup for windows";;
    MinGw*) echo "Not setup for windows";;
    Linux*) echo "If you dont have zsh installed cancel now";;
    Darwin*) echo "macOS setup script"; 
        # install homebrew
        echo "\e[92mInstalling Homebrew\e[39m"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

        # echo "\e[92mInstalling Git\e[39m"
        # brew install git
        echo "\e[92mInstalling wget\e[39m"
        brew install wget

        echo "\e[92mInstalling oh-my-zsh\e[39m"
        sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
        # echo "\e[92mInstalling nvm (Node Version Manager)\e[39m"

        echo "\n[92mInstalling Latex for use with VS Code"
        brew cask install mactex-no-gui
        sudo tlmgr update --self && sudo tlmgr update --all

        echo "\e[92mInstalling Angular & NestJS CLI\e[39m"
        npm install -g @angular/cli @nestjs/cli firebase-tools

        # echo "\e[92mInstalling Python\e[39m"
        # Test this
        # sed  '/export PATH="//usr/local/opt/python/libexec/bin:' ./zshrc
        # brew install python
        echo "\e[92mMake Dev Folder\e[39m"
        mkdir ~/Development
        # echo "\e[92mInstall Flutter\e[39m"
        # git clone https://github.com/flutter/flutter.git ~/Development
        # cd flutter
        # git checkout stable
        # sed  '/export PATH="$PATH:`~/Development/flutter/bin"' ./zshrc
esac




