## clone my config files
gh repo clone maksymrusanov/config
## copy all files to proper folder(/.config)
cd ~/.config/config
cp -r i3 i3status rofi fontconfig ~/.config/ 
cat nanorc > "$HOME/.Xresources"
## get all packages 
sudo pacman -S --needed - < pkglist.txt
