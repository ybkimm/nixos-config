{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_23
  ];
}
