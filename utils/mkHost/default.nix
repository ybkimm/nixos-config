inputs@{ self, nixpkgs, nix-darwin, nix-ld, home-manager, mac-app-util, sops-nix, ... }: node:

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
      sops-nix.nixosModules.sops
      nix-ld.nixosModules.nix-ld
      { programs.nix-ld.dev.enable = true; }
    ];
    darwin = [
      mac-app-util.darwinModules.default
      home-manager.darwinModules.home-manager
      sops-nix.darwinModules.sops
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
      {
        sops.defaultSopsFile = ../../secrets/secrets.yaml;
        sops.defaultSopsFormat = "yaml";
        sops.age.keyFile = "/var/lib/sops-nix/key.txt";
      }
      (inputs.self + /hosts/${node.host})
    ];
  };
}
