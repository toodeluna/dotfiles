#!/usr/bin/sh

mkdir_if_not_exist() {
	if [ ! -d $1 ]; then
		mkdir -p $1
	fi
}

# Scripts
cp -r ./scripts/* $HOME/.luna/scripts

# XOrg
cp ./xorg/.xinitrc $HOME
cp ./xorg/.Xresources $HOME

# XMonad
mkdir_if_not_exist $HOME/.config/xmonad
cp -r ./xmonad/* $HOME/.config/xmonad

# XMobar
cp ./xmobar/.xmobarrc $HOME

# Alacritty
mkdir_if_not_exist "$HOME/.config/alacritty"
cp -r ./alacritty/* $HOME/.config/alacritty

# Fish
mkdir_if_not_exist "$HOME/.config/fish"
cp -r ./fish/* $HOME/.config/fish

# GTK
mkdir_if_not_exist "$HOME/.config/gtk-3.0"
cp -r ./gtk/* "$HOME/.config/gtk-3.0"

# Neovim
if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

mkdir_if_not_exist "$HOME/.config/nvim"
cp -r ./neovim/* $HOME/.config/nvim

# Picom
mkdir_if_not_exist "$HOME/.config/picom"
cp -r ./picom/* $HOME/.config/picom

# Rofi
mkdir_if_not_exist "$HOME/.config/rofi"
mkdir_if_not_exist "$HOME/.local/share/rofi/themes"

cp ./rofi/config.rasi $HOME/.config/rofi
cp -r ./rofi/themes $HOME/.local/share/rofi

