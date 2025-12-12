{ pkgs, ... }:
{
  imports = [
    ../ybkimm

    ./apps/claude
    ./apps/graphics_gd
    ./apps/k8s
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

  home.sessionPath = [
    "$HOME/.local/bin"
  ];
}
