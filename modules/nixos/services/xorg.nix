{ lib, config, ... }:
{
  services.xserver = {
    enable = true;
    videoDrivers = lib.mkIf (config.gpu == "amd") [ "amdgpu" ];
  };
}
