inputs@{ self, nixpkgs, nix-darwin, home-manager, mac-app-util, ... }: node:

let
  inherit (self) outputs;
  systemConfiguration = {
    nixos = "nixosConfigurations";
    darwin = "darwinConfigurations";
  }.${node.os};
  theSystem = {
    nixos = nixpkgs.lib.nixosSystem;
    darwin = nix-darwin.lib.darwinSystem;
  }.${node.os};
  modules = {
    nixos = [
      home-manager.nixosModules.home-manager
    ];
    darwin = [
      mac-app-util.darwinModules.default
      home-manager.darwinModules.home-manager
      {
        home-manager.sharedModules = [
          mac-app-util.homeManagerModules.default
        ];
      }
    ];
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
          extraSpecialArgs = { inherit inputs outputs; };
        };

        nixpkgs = {
          overlays = [
            outputs.overlays.additions
            outputs.overlays.modifications
          ];
        };
      }
      (inputs.self + /hosts/${node.host})
    ];
  };
}
