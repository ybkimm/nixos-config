{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cmake
    gcc14
  ];
}
