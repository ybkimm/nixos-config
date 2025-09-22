{ pkgs, ... }:
{
  imports = [
    ../ybkimm

    ./apps/claude
    ./apps/k8s
  ];

  home.packages = with pkgs; [
    keepassxc
    librewolf
    age
  ];

  services.spotifyd = {
    enable = true;
  };
}
