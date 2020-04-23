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

        # git is installed on catalina
        # echo "\e[92mInstalling Git\e[39m"
        # brew install git
        sed -i '' 's/plugins=(/plugins=(git osx /' ~/.zshrc

        # Install wget for use
        echo "\e[92mInstalling wget\e[39m"
        brew install wget

        echo "\e[92mInstalling nvm\e[39m"
        wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
        . ~/.zshrc
        # install node v10 & 12 latest latest
        nvm install nvm install --lts=dubnium
        nvm install nvm install --lts=erbium
        nvm use --lts

        echo "\e[92mInstalling oh-my-zsh\e[39m"
        sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
        sed -i '' 's/plugins=(/plugins=(zsh-autosuggestions /' ~/.zshrc
        sed -i '' 's/plugins=(/plugins=(zsh-syntax-highlighting /' ~/.zshrc
       
        echo "\e[92mInstalling Powerline Fonts\e[39m"
        git clone https://github.com/powerline/fonts.git ~/Downloads/fonts --depth=1
        cd ~/Downloads/fonts
        sudo ./install.sh
        cd ..
        rm -rf fonts

        # echo "\n[92mInstalling Latex for use with VS Code"
        # brew cask install mactex-no-gui
        # # test if this works in shell
        # . ~/.zshrc
        # sudo tlmgr update --self && sudo tlmgr update --all

        echo "\e[92mInstalling Angular, NestJS CLI, Firebase-Tools, Ionic\e[39m"
        npm install -g @angular/cli @nestjs/cli firebase-tools @ionic/cli

        echo "\e[92mInstalling XCode command line tools\e[39m"
        xcode-select --install
        # echo "\e[92mInstalling Python\e[39m"
        # Test this
        # sed  '/export PATH="//usr/local/opt/python/libexec/bin:' ./zshrc
        # brew install python

        echo "\e[92mMake Dev Folder\e[39m"
        mkdir ~/Development

        # Flutter
        echo "\e[92mInstall Flutter\e[39m"
        git clone https://github.com/flutter/flutter.git ~/Development/flutter
        cd ~/Development/flutter
        git checkout stable
        echo '\nexport PATH=$PATH:~/Development/flutter/bin' >> ~/.zshrc
        . ~/.zshrc
        cd ~/
esac




