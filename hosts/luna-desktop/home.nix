{ pkgs, ... }:
{
  home.stateVersion = "24.05";
  home.username = "luna";
  home.homeDirectory = "/home/luna";

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
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
  programs.firefox.enable = true;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = "fish_vi_key_bindings";
    shellAliases = {
      q = "exit";
      cls = "clear";
      collect-garbage = "sudo nix-collect-garbage --delete-old";
      rebuild = "sudo nixos-rebuild switch --flake ~/GitHub/toodeluna/dotfiles";
    };
  };

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

  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };

      window = {
        opacity = 0.95;
        padding = {
          x = 4;
          y = 4;
        };
      };

      font = {
        size = 16;
        normal = {
          family = "IosevkaCustom Nerd Font";
          style = "Regular";
        };
      };
    };
  };
}
