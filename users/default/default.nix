{ pkgs, outputs, ... }:
{
  imports = [
    ./apps/devtools
    ./apps/fish
    ./apps/neovim
    ./apps/golang
  ];

  home.packages = with pkgs; [
    neofetch
  ];
}
