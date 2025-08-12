{ pkgs, ... }:
{
  imports = [
    ../ybkimm

    ./apps/kubectl
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
