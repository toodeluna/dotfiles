{ lib, ... }:
{
  options = {
    gpu = lib.mkOption {
      type = lib.types.enum [
        "amd"
        "intel"
      ];
    };
  };
}
