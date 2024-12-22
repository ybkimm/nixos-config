{
  description = "NixOS configuration";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-24.11";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mac-app-util = {
      url = "github:hraban/mac-app-util";
    };
  };

  outputs = inputs@{ nixpkgs, nix-darwin, home-manager, ... }:
    let
      nodes = [
        { host = "devvm"; os = "nixos"; system = "x86_64-linux"; }
        { host = "ybkimm-mbp"; os = "darwin"; system = "aarch64-darwin"; }
      ];
      mkHost = import ./utils/mkHost inputs;
    in
      nixpkgs.lib.foldl' nixpkgs.lib.recursiveUpdate {} (map mkHost nodes);
}
