#! /bin/bash

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 1000
defaults write com.apple.dock no-bouncing -bool TRUE
defaults write com.apple.dock persistent-apps "()"
defaults write com.apple.dock show-recents 0
killall Dock
defaults write com.apple.dock wvous-br-corner 1
defaults write "Apple Global Domain" com.apple.swipescrolldirection 0

mkdir ~/Code ~/School
sudo touch ~/.hushlogin

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install --cask google-chrome
# brew install --cask homebrew/cask-drivers/steelseries-exactmouse-tool

brew install --cask visual-studio-code
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
mkdir -p ~/Library/"Application Support"/Code/User && touch ~/Library/"Application Support"/Code/User/settings.json
echo "{\"workbench.colorTheme\":\"OneDarkPro\",\"workbench.iconTheme\":\"material-icon-theme\",\"workbench.startupEditor\":\"none\",\"terminal.integrated.defaultProfile.osx\":\"fish\",\"editor.defaultFormatter\":\"esbenp.prettier-vscode\",\"editor.tabSize\":2,\"editor.formatOnSave\":true,\"editor.minimap.enabled\":false,\"editor.lightbulb.enabled\":false,\"explorer.confirmDelete\":false,\"explorer.confirmDragAndDrop\":false,\"javascript.suggest.paths\":false,\"liveServer.settings.host\":\"localhost\",\"liveServer.settings.port\":3000,\"liveServer.settings.donotShowInfoMsg\":true,\"[rust]\":{\"editor.defaultFormatter\":\"matklad.rust-analyzer\"},\"[html]\":{\"editor.defaultFormatter\":\"vscode.html-language-features\"},\"files.exclude\":{\"**/Cargo.lock\":true,\"**/target\":true,\"**/node_modules\":true,\"**/yarn.lock\":true,\"**/pages/_app.js\":true,\"**/.next\":true}}" | tee ~/Library/"Application Support"/Code/User/settings.json

for extension in bungcip.better-toml christian-kohler.path-intellisense esbenp.prettier-vscode matklad.rust-analyzer PKief.material-icon-theme ritwickdey.LiveServer vadimcn.vscode-lldb vscodevim.vim zhuangtongfa.material-theme
do code --install-extension $extension
done

brew install fish
echo "/usr/local/bin/fish
/bin/bash
/bin/zsh" | sudo tee /etc/shells
chsh -s /usr/local/bin/fish
fish -c "set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths && set -U fish_greeting && set -U fish_key_bindings fish_vi_key_bindings"

brew install node
npm i -g yarn nodemon typescript

brew install git mkcert 1password

chflags hidden ~/Desktop ~/Pictures/
