{ config, ... }:
{
  networking = {
    hostName = config.name;
    firewall.enable = true;
  };
}
