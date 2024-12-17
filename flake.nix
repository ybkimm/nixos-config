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
  };

  outputs = inputs@{ nixpkgs, nix-darwin, home-manager, ... }:
    let
      nodes = [
        { host = "devvm"; os = "nixos"; system = "x86_64-linux"; }
      ];
      mkHost = node:
        let
          systemConfiguration = {
            nixos = "nixosConfigurations";
            darwin = "darwinConfigurations";
          }.${node.os};
          theSystem = {
            nixos = nixpkgs.lib.nixosSystem;
            darwin = nix-darwin.lib.darwinSystem;
          }.${node.os};
          modules = {
            nixos = [ home-manager.nixosModules.home-manager ];
            darwin = [ home-manager.darwinModules.home-manager ];
          }.${node.os};
        in
        {
          ${systemConfiguration}.${node.host} = theSystem {
            system = node.system;
            specialArgs = inputs;
            modules = modules ++ [
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = inputs;
                };
              }
              ./hosts/${node.host}
            ];
          };
        };
    in
      nixpkgs.lib.foldl' nixpkgs.lib.recursiveUpdate {} (map mkHost nodes);
}
