## clone my config files
gh repo clone maksymrusanov/dotfiles && cd dotfiles 
## copy all files to proper folder(/.config)
cp -r i3 i3status rofi fontconfig  nvim kitty ~/.config/
## install all packages
sudo pacman -S  kitty nvim rofi ozh
## config for xterm 
cat nanorc > "$HOME/.Xresources"
