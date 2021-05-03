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

        echo "\033[0;31m Installing Angular, NestJS CLI, Firebase-Tools, Ionic\033[0m"
        npm install -g @angular/cli @nestjs/cli firebase-tools @ionic/cli;;
#########################################################################################################################################################
    Mac*) echo "macOS setup script"
        # install homebrew
        echo "\033[0;31m Installing Homebrew \033[0m"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        brew doctor
        brew install zsh
        sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)

        # git is installed on catalina
        # echo "\033[0;31m Installing Git\033[0m"
        # brew install git
        sed -i '' 's/plugins=(/plugins=(git /' ~/.zshrc
        sed -i '' 's/plugins=(/plugins=(osx /' ~/.zshrc

        # Install wget for use
        echo "\033[0;31m Installing wget\033[0m"
        brew install wget
        source ~/.zshrc

        # Install 7Zip for mac
        brew install p7zip

        # Download and install postman
        curl https://dl.pstmn.io/download/latest/osx -o ~/Downloads/Postman-mac.zip
        unzip ~/Downloads/Postman-mac.zip -d ~/Downloads
        mv ~/Downloads/Postman.app ~/Applications

        # curl https://download.mozilla.org/\?product=firefox-latest-ssl\&os=osx\&lang=en-US -o ~/Downloads/Firefox-mac.dmg

        echo "\033[0;31m Installing nvm\033[0m"
        wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
        source ~/.zshrc

        # install node v10 & v12 latest latest
        nvm install --lts=dubnium
        nvm install --lts=erbium
        nvm use --lts
        source ~/.zshrc

        echo "\033[0;31m Installing oh-my-zsh\033[0m"
        sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
        sed -i '' 's/plugins=(/plugins=(zsh-autosuggestions /' ~/.zshrc
        sed -i '' 's/plugins=(/plugins=(zsh-syntax-highlighting /' ~/.zshrc
        #set agnoster theme comment out if you want default
        sed -i '' 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc
       
        echo "\033[0;31m Installing Powerline Fonts\033[0m"
        git clone https://github.com/powerline/fonts.git ~/Downloads/fonts --depth=1
        cd ~/Downloads/fonts
        sudo ./install.sh
        cd ..
        rm -rf fonts

        # echo "\n[92mInstalling Latex for use with VS Code"
        # brew install --cask mactex-no-gui
        # test if this works in shell
        # . ~/.zshrc
        # sudo tlmgr update --self && sudo tlmgr update --all

        echo "\033[0;31m Installing Angular, NestJS CLI, Firebase-Tools, Ionic\033[0m"
        npm install -g @angular/cli @nestjs/cli firebase-tools @ionic/cli serve

        echo "\033[0;31m Installing XCode command line tools\033[0m"
        xcode-select --install
        # echo "\033[0;31m Installing Python\033[0m"
        # Test this
        # sed  '/export PATH="//usr/local/opt/python/libexec/bin:' ./zshrc
        # brew install python

        echo "\033[0;31m Make Dev Folder\033[0m"
        mkdir ~/Development

        # Flutter
        echo "\033[0;31m Install Flutter\033[0m"
        git clone https://github.com/flutter/flutter.git ~/Development/flutter
        cd ~/Development/flutter
        git checkout stable
        echo 'export PATH=$PATH:~/Development/flutter/bin' >> ~/.zshrc
        . ~/.zshrc
        cd ~/

        brew tap homebrew/cask-fonts
        brew install --cask font-fira-code

        #Installing java
        brew tap AdoptOpenJDK/openjdk
        brew install --cask adoptopenjdk8
        brew install --cask adoptopenjdk13



        #Quality of Life installations uncomment the ones you want to install
        # brew install --cask stats
esac