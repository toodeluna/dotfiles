{ pkgs, ... }:
{
  home.stateVersion = "24.05";
  home.username = "luna";
  home.homeDirectory = "/home/luna";

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    EDITOR = "nvim";
    BROWSER = "firefox";
  };

  home.packages = with pkgs; [
    rofi-wayland
    spotify
    discord
    hyprpaper
    ncpamixer
    stremio
  ];

  programs.home-manager.enable = true;
  programs.neovim.enable = true;
  programs.git.enable = true;
  programs.firefox.enable = true;
  programs.alacritty.enable = true;
  programs.fish.enable = true;
}
