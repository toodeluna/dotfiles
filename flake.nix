{
  description = "My Linux and Mac OS dotfiles in a Nix flake.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
      formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixfmt-rfc-style;

      nixosConfigurations.luna-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/luna-desktop/configuration.nix ];
      };
    };
}
