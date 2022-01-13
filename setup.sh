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
echo "{
  \"workbench.colorTheme\": \"One Dark Pro\",
  \"workbench.iconTheme\": \"material-icon-theme\",
  \"editor.defaultFormatter\": \"esbenp.prettier-vscode\",
  \"editor.formatOnSave\": true,
  \"editor.parameterHints.enabled\": false,
  \"editor.hover.delay\": 1200,
  \"editor.snippetSuggestions\": \"none\",
  \"editor.tabSize\": 2,
  \"editor.minimap.enabled\": false,
  \"editor.lightbulb.enabled\": false,
  \"editor.bracketPairColorization.enabled\": true,
  \"editor.guides.bracketPairs\": \"active\",
  \"terminal.integrated.defaultProfile.osx\": \"fish\",
  \"javascript.suggest.paths\": false,
  \"typescript.suggest.paths\": false,
  \"liveServer.settings.host\": \"localhost\",
  \"liveServer.settings.port\": 3000,
  \"explorer.confirmDelete\": false,
  \"workbench.startupEditor\": \"none\",
  \"files.exclude\": {
    \"**/Cargo.lock\": true,
    \"**/node_modules\": true,
    \"**/package-lock.json\": true,
    \"**/yarn.lock\": true,
    \"**/.next\": true,
    \"**/_app.js\": true,
    \"**/next-env.d.ts\": true
  },
  \"[rust]\": {
    \"editor.defaultFormatter\": \"matklad.rust-analyzer\"
  },
  \"emmet.showExpandedAbbreviation\": \"never\",
  \"explorer.confirmDragAndDrop\": false
}
" | tee ~/Library/"Application Support"/Code/User/settings.json

for extension in bungcip.better-toml christian-kohler.path-intellisense esbenp.prettier-vscode matklad.rust-analyzer PKief.material-icon-theme ritwickdey.LiveServer vadimcn.vscode-lldb vscodevim.vim zhuangtongfa.material-theme
do code --install-extension $extension
done

brew install fish
echo "/usr/local/bin/fish
/bin/bash
/bin/zsh" | sudo tee /etc/shells
chsh -s /usr/local/bin/fish
fish -c "set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths && set -U fish_greeting && set -U fish_key_bindings fish_vi_key_bindings"
mkdir -p ~/.config/fish/functions && touch ~/.config/fish/functions/fish_prompt.fish
echo "function fish_prompt 
  echo -n -s (set_color \$fish_color_cwd) (prompt_pwd) (set_color normal) \">\" 
end" | tee ~/.config/fish/functions/fish_prompt.fish
touch ~/.config/fish/functions/jf.fish
echo "function jf --wraps='ls -A' --description 'alias jf ls -A'
  ls -A \$argv; 
end" | tee ~/.config/fish/functions/jf.fish

brew install node
npm i -g yarn nodemon

brew install git 1password

rm -rf ~/Movies ~/Music ~/Applications ~/Public
