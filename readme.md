## clone my config files
gh repo clone maksymrusanov/dotfiles && cd dotfiles 
## copy all files to proper folder(/.config)
cp -r i3 i3status rofi fontconfig  nvim kitty ~/.config/
## config for xterm 
cat nanorc > "$HOME/.Xresources"
