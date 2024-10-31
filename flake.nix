{
  description = "My Linux and Mac OS dotfiles in a Nix flake.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
    }:
    let
      colorscheme = import ./config/colorscheme.nix;

      pkgs = {
        x86_64-linux = import nixpkgs {
          config.allowUnfree = true;
          system = "x86_64-linux";
          overlays = [ (import ./overlays/iosevka-custom-nerd-font.nix) ];
        };

        aarch64-darwin = import nixpkgs {
          config.allowUnfree = true;
          system = "aarch64-darwin";
          overlays = [ (import ./overlays/iosevka-custom-nerd-font.nix) ];
        };
      };
    in
    {
      formatter.x86_64-linux = pkgs.x86_64-linux.nixfmt-rfc-style;
      formatter.aarch64-darwin = pkgs.aarch64-darwin.nixfmt-rfc-style;

      nixosConfigurations.luna-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit colorscheme;
          pkgs = pkgs.x86_64-linux;
        };

        modules = [
          home-manager.nixosModules.home-manager
          ./hosts/luna-desktop/configuration.nix
        ];
      };
    };
}
