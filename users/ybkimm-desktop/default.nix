{ pkgs, ... }:
{
  imports = [
    ../ybkimm

    ./apps/kubectl
    ./apps/graphics_gd
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
