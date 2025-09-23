{ pkgs, outputs, ... }:
{
  imports = [
    ./apps/devtools
    ./apps/fish
    ./apps/golang
    ./apps/neovim
  ];
}
