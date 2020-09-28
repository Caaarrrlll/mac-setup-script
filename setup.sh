unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
echo ${machine}
#########################################################################################################################################################
case ${machine} in
    Cygwin*)  echo "Not setup for windows";;
    MinGw*) echo "Not setup for windows";;
    Linux*) echo "This will only work on systems that use aptitude!!!";
        sudo apt-get install zsh git
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
        sed -i 's/plugins=(/plugins=(zsh-autosuggestions /' ~/.zshrc
        sed -i 's/plugins=(/plugins=(zsh-syntax-highlighting /' ~/.zshrc
        # Set theme to agnoster
        sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc
        sed -i '$ a export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"' ~/.zshrc
        sed -i '$ a [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' ~/.zshrc
        source ~/.zshrc

        # install node v10 & v12 latest latest
        nvm install --lts=dubnium
        nvm install --lts=erbium
        nvm use --lts
        source ~/.zshrc

        echo "\e[92mInstalling Angular, NestJS CLI, Firebase-Tools, Ionic\e[39m"
        npm install -g @angular/cli @nestjs/cli firebase-tools @ionic/cli;;
#########################################################################################################################################################
    Mac*) echo "macOS setup script"
        # install homebrew
        echo "\e[92mInstalling Homebrew\e[39m"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        brew doctor
        brew install zsh
        sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)

        # git is installed on catalina
        # echo "\e[92mInstalling Git\e[39m"
        # brew install git
        sed -i '' 's/plugins=(/plugins=(git /' ~/.zshrc
        sed -i '' 's/plugins=(/plugins=(osx /' ~/.zshrc

        # Install wget for use
        echo "\e[92mInstalling wget\e[39m"
        brew install wget
        source ~/.zshrc

        echo "\e[92mInstalling nvm\e[39m"
        wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
        source ~/.zshrc

        # install node v10 & v12 latest latest
        nvm install --lts=dubnium
        nvm install --lts=erbium
        nvm use --lts
        source ~/.zshrc

        echo "\e[92mInstalling oh-my-zsh\e[39m"
        sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
        sed -i '' 's/plugins=(/plugins=(zsh-autosuggestions /' ~/.zshrc
        sed -i '' 's/plugins=(/plugins=(zsh-syntax-highlighting /' ~/.zshrc
        #set agnoster theme comment out if you want default
        sed -i '' 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc
       
        echo "\e[92mInstalling Powerline Fonts\e[39m"
        git clone https://github.com/powerline/fonts.git ~/Downloads/fonts --depth=1
        cd ~/Downloads/fonts
        sudo ./install.sh
        cd ..
        rm -rf fonts

        # echo "\n[92mInstalling Latex for use with VS Code"
        brew cask install mactex-no-gui
        # test if this works in shell
        . ~/.zshrc
        sudo tlmgr update --self && sudo tlmgr update --all

        echo "\e[92mInstalling Angular, NestJS CLI, Firebase-Tools, Ionic\e[39m"
        npm install -g @angular/cli @nestjs/cli firebase-tools @ionic/cli serve

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
        echo 'export PATH=$PATH:~/Development/flutter/bin' >> ~/.zshrc
        . ~/.zshrc
        cd ~/

        brew tap homebrew/cask-fonts
        brew cask install font-fira-code

        #Installing java
        brew tap AdoptOpenJDK/openjdk
        brew cask install adoptopenjdk8
        brew cask install adoptopenjdk13
esac