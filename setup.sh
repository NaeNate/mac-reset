#! /bin/bash

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 1000
defaults write com.apple.dock no-bouncing -bool TRUE
defaults write com.apple.dock persistent-apps "()"
defaults write com.apple.dock show-recents 0
defaults write com.apple.dock wvous-br-corner 1

mkdir ~/Code ~/School
sudo touch ~/.hushlogin

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install --cask google-chrome
# brew install --cask homebrew/cask-drivers/steelseries-exactmouse-tool

brew install --cask visual-studio-code 
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
mkdir -p ~/Downloads/"Application Support"/Code/User && touch ~/Library/"Application Support"/Code/User/settings.json
 echo "{
   \"workbench.colorTheme\": \"One Dark Pro\",
   \"workbench.iconTheme\": \"material-icon-theme\",
   \"editor.defaultFormatter\": \"esbenp.prettier-vscode\",
   \"editor.formatOnSave\": true,
   \"editor.minimap.enabled\": false,
   \"editor.tabSize\": 4,
   \"window.zoomLevel\": 1,
   \"workbench.startupEditor\": \"none\",
   \"explorer.confirmDelete\": false,
   \"terminal.integrated.defaultProfile.osx\": \"fish\",
   // \"terminal.integrated.defaultProfile.osx\": \"bash\",
   
   \"files.exclude\": {
     \"**/node_modules\": true,
     \"**/package-lock.json\": true,
     \"**/yarn.lock\": true
   },
  \"[rust]\": {
    \"editor.defaultFormatter\": \"rust-lang.rust\"
  }
 }" | tee "~/Library/Application\ Support/Code/User/settings.json"

for extension in esbenp.prettier-vscode PKief.material-icon-theme ritwickdey.LiveServer vscodevim.vim zhuangtongfa.material-theme rust-lang.rust
  do code --install-extension $extension
done

brew install fish
echo "/usr/local/bin/fish
/bin/bash
/bin/zsh" | sudo tee /etc/shells
chsh -s /usr/local/bin/fish
fish -c "set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths" 
fish -c "set -U fish_greeting"
fish -c "fish_vi_key_bindings"

mkdir -p ~/.config/fish/functions && touch ~/.config/fish/functions/fish_prompt.fish

echo "function fish_prompt
  echo -n -s (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) ">"
end" | tee "./config/fish/functions/fish_prompt.fish"

brew install node
npm i -g yarn nodemon

brew install git

sudo rm -rf ~/Movies ~/Music ~/Public ~/Pictures ~/Documents
