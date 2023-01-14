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
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        brew doctor

        # Install wget for use
        echo "\033[0;31m Installing wget\033[0m"
        brew install wget

        echo "\033[0;31m Installing oh-my-zsh\033[0m"
        sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
        sed -i '' 's/plugins=(/plugins=(zsh-autosuggestions /' ~/.zshrc
        sed -i '' 's/plugins=(/plugins=(zsh-syntax-highlighting /' ~/.zshrc
        #set agnoster theme comment out if you want default
        sed -i '' 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc

        sed -i '' 's/plugins=(/plugins=(git /' ~/.zshrc
        sed -i '' 's/plugins=(/plugins=(macos /' ~/.zshrc
        source $HOME/.zshrc

        ## Install 7Zip for mac
        brew install p7zip

        ## Download and install postman
        curl https://dl.pstmn.io/download/latest/osx -o ~/Downloads/Postman-mac.zip
        unzip ~/Downloads/Postman-mac.zip -d ~/Downloads
        mv ~/Downloads/Postman.app ~/Applications

        echo "\033[0;31m Installing nvm\033[0m"
        wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
        source $HOME/.zshrc

        ## install node v14 latest latest
        # nvm install --lts=erbiumx
        nvm install --lts=fermium
        nvm use --lts
        source $HOME/.zshrc

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
        npm install -g @angular/cli 
        # npm i -g firebase-tools @ionic/cli @nestjs/cli serve strapi

        echo "\033[0;31m Installing XCode command line tools\033[0m"
        xcode-select --install

        # echo "\033[0;31m Installing Python\033[0m"
        # brew install python
        # echo 'export PATH="/usr/local/opt/python/libexec/bin:$PATH"' >> ~/.zshrc

        # Flutter
        echo "\033[0;31m Install Flutter\033[0m"
        mkdir ~/Development
        git clone https://github.com/flutter/flutter.git -b stable ~/Development/flutter
        cd ~/Software/flutter
        git checkout stable
        echo 'export FLUTTER_DIR="$HOME/Software/flutter/bin"' >> ~/.zshrc
        echo 'export PATH="$PATH:$FLUTTER_DIR"' >> ~/.zshrc
        source $HOME/.zshrc
        cd ~/

        # brew tap homebrew/cask-fonts
        # brew install --cask font-fira-code

        #Installing java
        # brew tap AdoptOpenJDK/openjdk
        # brew install --cask adoptopenjdk8
        # brew install --cask adoptopenjdk15-openj9

        #Quality of Life installations uncomment the ones you want to install
        # brew install --cask stats

        # echo "\033[0;31m Install VS Code\033[0m"
        # curl -L https://code.visualstudio.com/sha/download\?build\=stable\&os\=darwin-universal -o ~/Downloads/VSCode-darwin-universal.zip
        # unzip ~/Downloads/VSCode-darwin-universal.zip -d ~/Downloads
        # mv ~/Downloads/Visual\ Studio\ Code.app ~/Applications

        # echo "\033[0;31m Install Azure Data Studio\033[0m"
        # curl -L https://go.microsoft.com/fwlink/?linkid=2176807 -o ~/Downloads/Azure-Data-Studio.zip
        # unzip ~/Downloads/Azure-Data-Studio.zip -d ~/Downloads
        # mv ~/Downloads/Azure\ Data\ Studio.app ~/Applications

        # Does not work as expected find better way to install dotnet
        # echo "\033[0;31m Install DotNet\033[0m"
        # sh -c "$(wget -O- https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh)"
        # echo 'export PATH="/usr/local/share/dotnet:$PATH"' >> ~/.zshrc
        # echo 'export PATH="$PATH:$HOME/.dotnet/tools/"' >> ~/.zshrc
        # dotnet tool install --global dotnet-ef
esac