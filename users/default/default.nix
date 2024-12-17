{ pkgs, ... }:
{
  imports = [
    ./apps/fish
    ./apps/neovim
  ];

  home.packages = with pkgs; [
    neofetch
  ];
}

