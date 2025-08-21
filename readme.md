## clone my config files
gh repo clone maksymrusanov/dotfiles && cd dotfiles 
## copy all files to proper folder(/.config)
cp -r i3 i3status rofi fontconfig ~/.config/
## config for xterm 
cat nanorc > "$HOME/.Xresources"
## get all packages 
sudo pacman -S --needed - < pkglist.txt
