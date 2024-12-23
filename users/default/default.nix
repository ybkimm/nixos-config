{ pkgs, outputs, ... }:
{
  imports = [
    ./apps/fish
    ./apps/neovim
    ./apps/golang
  ];

  home.packages = with pkgs; [
    neofetch
  ];
}
