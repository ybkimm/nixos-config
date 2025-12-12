{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (lutris.override {
      extraPkgs =  pkgs: [
        gamemode
      ];
      extraLibraries =  pkgs: [
        # List library dependencies here
      ];
    })
  ];
}
