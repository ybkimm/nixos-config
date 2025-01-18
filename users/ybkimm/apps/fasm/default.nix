{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fasm
  ];
}
