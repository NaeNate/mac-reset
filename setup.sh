#! /bin/bash
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 1000
defaults write com.apple.dock no-bouncing -bool TRUE
defaults write com.apple.dock persistent-apps "()"
defaults write com.apple.dock show-recents 0

chflags hidden /Users/nate/Applications /Users/nate/Desktop /Users/nate/Documents /Users/nate/Movies /Users/nate/Music /Users/nate/Pictures /Users/nate/Public 

mkdir ~/Code ~/School
touch ~/.hushlogin

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

brew install --cask google-chrome
brew install --cask homebrew/cask-drivers/steelseries-exactmouse-tool
brew install --cask tor-browser

brew install --cask visual-studio-code 
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
echo `{
  "workbench.colorTheme": "One Dark Pro",
  "workbench.iconTheme": "material-icon-theme",
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.formatOnSave": true,
  "window.zoomLevel": 1,
  "editor.tabSize": 4,
  "editor.minimap.enabled": false,
  "workbench.startupEditor": "none",
  "explorer.confirmDelete": false,
  "terminal.integrated.defaultProfile.osx": "fish",
  // "terminal.integrated.defaultProfile.osx": "bash",
  "files.exclude": {
    "**/node_modules": true,
    "**/package-lock.json": true,
    "**/yarn.lock": true
  }
}` | tee ~/Library/Application\ Support/Code/User/settings.json
for extension in esbenp.prettier-vscode PKief.material-icon-theme ritwickdey.LiveServer vscodevim.vim zhuangtongfa.material-theme
  do code --install-extension $extension
done

brew install fish
echo "/usr/local/bin/fish
/bin/bash
/bin/zsh" | tee /etc/shells
chsh -s /usr/local/bin/fish
fish -c "set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths && set -U fish_greeting && set -U fish_greeting"
touch ~/.config/fish/functions/nvm.fish

fisher add edc/bass

echo "function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end" | tee ~/.config/fish/functions/nvm.fish
nvm install node
