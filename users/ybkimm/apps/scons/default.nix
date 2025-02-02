{ pkgs, ... }:
{
  home.packages = with pkgs; [
    scons
  ];
}
