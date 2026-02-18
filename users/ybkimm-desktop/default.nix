{ pkgs, ... }:
{
  imports = [
    ../ybkimm-dev

    ./apps/lutris
  ];

  home.packages = with pkgs; [
    age
    chromium
    freelens
    keepassxc
    librewolf
    spotify
  ];
}
