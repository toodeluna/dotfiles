{ lib, config, ... }:
{
  boot = {
    initrd.kernelModules = lib.mkIf (config.gpu == "amd") [ "amdgpu" ];

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
