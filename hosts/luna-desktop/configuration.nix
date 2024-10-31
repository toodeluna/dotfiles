{ pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  system.stateVersion = "24.05";
  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Brussels";
  i18n.defaultLocale = "en_US.UTF-8";
  security.sudo.extraConfig = "Defaults env_reset,pwfeedback";
  console.useXkbConfig = true;

  boot = {
    initrd.kernelModules = [ "amdgpu" ];

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "luna-desktop";
    firewall.enable = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.luna = import ./home.nix;
  };

  services.displayManager.ly = {
    enable = true;

    settings = {
      vi_mode = true;
      clear_password = true;
      clock = "%D %H:%M";
    };
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];

    xkb = {
      layout = "us";
      options = "caps:escape";
    };
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  programs.fish = {
    enable = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  users.users.luna = {
    isNormalUser = true;
    description = "Luna Heyman";
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Iosevka" ]; })
  ];
}
