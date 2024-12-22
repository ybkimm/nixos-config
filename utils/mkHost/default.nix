inputs@{ nixpkgs, nix-darwin, home-manager, ... }: node:

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
    modules = modules ++ [
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = inputs;
        };
      }
      (inputs.self + /hosts/${node.host})
    ];
  };
}
