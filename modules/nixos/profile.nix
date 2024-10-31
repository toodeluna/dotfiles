{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    profile = lib.mkOption {
      type = lib.types.submodule {
        options = {
          shortName = lib.mkOption {
            type = lib.types.str;
          };

          fullName = lib.mkOption {
            type = lib.types.str;
          };
        };
      };
    };
  };

  config = {
    users.users.${config.profile.shortName} = {
      isNormalUser = true;
      description = config.profile.fullName;
      shell = pkgs.fish;
      extraGroups = [ "wheel" ];
    };
  };
}
