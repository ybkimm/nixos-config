{ pkgs, ... }:
{
  imports = [
    ../ybkimm
  ];

  home.packages = with pkgs; [
    keepassxc
  ];
}
