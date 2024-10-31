{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  name = "luna-desktop";
  gpu = "amd";
  gamer = true;
  home-file = ./home.nix;
  profile = {
    shortName = "luna";
    fullName = "Luna Heyman";
  };

  system.stateVersion = "24.05";
}
