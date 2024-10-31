{ ... }:
{
  imports = [
    ./profile.nix
    ./fonts.nix

    ./system/nix-settings.nix
    ./system/localization.nix
    ./system/gpu.nix
    ./system/name.nix
    ./system/boot.nix
    ./system/input.nix
    ./system/networking.nix
    ./system/sudo.nix

    ./services/xorg.nix
    ./services/pipewire.nix
    ./services/display-manager.nix

    ./programs/fish.nix
    ./programs/hyprland.nix
    ./programs/steam.nix
    ./programs/home-manager.nix
  ];
}
