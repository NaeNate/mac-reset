#! /bin/bash

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 1000
defaults write com.apple.dock no-bouncing -bool TRUE
defaults write com.apple.dock persistent-apps "()"
defaults write com.apple.dock show-recents 0

mkdir ~/Code ~/School
sudo touch ~/.hushlogin

chflags hidden /Users/nate/Desktop /Users/nate/Documents /Users/nate/Movies /Users/nate/Music /Users/nate/Pictures /Users/nate/Public 

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install --cask google-chrome
brew install --cask homebrew/cask-drivers/steelseries-exactmouse-tool
brew install --cask tor-browser

brew install --cask visual-studio-code 
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
echo "{
  \"workbench.colorTheme\": \"One Dark Pro\",
  \"workbench.iconTheme\": \"material-icon-theme\",
  \"editor.defaultFormatter\": \"esbenp.prettier-vscode\",
  \"editor.formatOnSave\": true,
  \"editor.tabSize\": 4,
  \"editor.minimap.enabled\": false,
  \"workbench.startupEditor\": \"none\",
  \"explorer.confirmDelete\": false,
  \"terminal.integrated.defaultProfile.osx\": \"fish\",
  // \"terminal.integrated.defaultProfile.osx\": \"bash\",
  \"files.exclude\": {
    \"**/node_modules\": true,
    \"**/package-lock.json\": true,
    \"**/yarn.lock\": true
  }
}" | tee ~/Library/Application\ Support/Code/User/settings.json

for extension in esbenp.prettier-vscode PKief.material-icon-theme ritwickdey.LiveServer vscodevim.vim zhuangtongfa.material-theme
  do code --install-extension $extension
done

brew install fish
echo "/usr/local/bin/fish
/bin/bash
/bin/zsh" | sudo tee /etc/shells
chsh -s /usr/local/bin/fish
fish -c "set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths && set -U fish_greeting"

brew install node

brew install git
