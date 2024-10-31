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
  programs.firefox.enable = true;
  programs.alacritty.enable = true;
  programs.fish.enable = true;

  programs.git = {
    enable = true;
    userName = "Luna Heyman";
    userEmail = "luna.heyman@proton.me";

    aliases = {
      lga = "log --graph --oneline --all --decorate";
      put = "push --set-upstream";
      rollback = "reset --hard HEAD";
    };

    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
