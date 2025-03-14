{
  description = "NixOS configuration";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mac-app-util = {
      url = "github:hraban/mac-app-util";
    };
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, ... }:
    let
      systems = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
      mkHost = import ./utils/mkHost inputs;
      configs = {
        packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});

        overlays = import ./overlays { inherit inputs; };
      };
      hostConfigs = [

        (mkHost { host = "devvm"; os = "nixos"; system = "x86_64-linux"; })
        (mkHost { host = "ybkimm-mbp"; os = "darwin"; system = "aarch64-darwin"; })
      ];
    in
      nixpkgs.lib.foldl' nixpkgs.lib.recursiveUpdate configs hostConfigs;
}
