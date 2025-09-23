{ pkgs, ... }:
{
  imports = [
    ../ybkimm

    ./apps/claude
    ./apps/graphics_gd
    ./apps/k8s
  ];

  home.packages = with pkgs; [
    age
    chromium
    freelens
    keepassxc
    librewolf
    ghostty
  ];

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  services.spotifyd = {
    enable = true;
  };
}
