#! /bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install fish fisher pnpm git
brew install --cask 1password expressvpn firefox raycast spotify visual-studio-code

echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
fish -c "set -U fish_greeting"
fish -c "fish_vi_key_bindings"
mkdir -p ~/.config/fish/functions && touch ~/.config/fish/functions/fish_prompt.fish
echo -e 'function fish_prompt\n  set_color $fish_color_cwd\n  echo -n (prompt_pwd)\n  set_color normal\n  echo -n " => "\nend' | tee ~/.config/fish/functions/fish_prompt.fish
echo -e 'function sl\n  ls -A1 $argv\nend' | tee ~/.config/fish/functions/sl.fish
echo -e "if status is-interactive\n  eval (ssh-agent -c) > /dev/null\nend" | tee ~/.config/fish/config.fish

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 1000
defaults write com.apple.dock no-bouncing -bool TRUE
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock show-process-indicators -bool false
defaults write com.apple.controlstrip FullCustomized '(NSTouchBarItemIdentifierFlexibleSpace, "com.apple.system.group.keyboard-brightness", "com.apple.system.group.brightness", "com.apple.system.group.volume")'
defaults write com.apple.menuextra.clock Show24Hour -bool true
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool false
defaults write com.apple.dock persistent-apps -array
killall Dock
killall ControlStrip

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fish -c "fish_add_path ~/.cargo/bin"

mkdir -p ~/stuff/code
touch ~/.hushlogin

echo -e "Host naenate\n  HostName github.com\n  IdentityFile ~/.ssh/naenate" | tee ~/.ssh/config

fish -c "fisher install jorgebucaran/nvm.fish"
fish -c "nvm install lts"
echo "AFTER RUNNING FISH set -U nvm_default_version"
