{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    gamer = lib.mkEnableOption "Enable gamer stuff";
  };

  config = lib.mkIf config.gamer {
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

    environment.systemPackages = with pkgs; [
      r2modman
    ];
  };
}
