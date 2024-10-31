{ lib, config, ... }:
{
  options = {
    home-file = lib.mkOption {
      type = lib.types.path;
    };
  };

  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.luna = import config.home-file;
    };
  };
}
