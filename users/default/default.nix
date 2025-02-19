{ pkgs, outputs, ... }:
{
  imports = [
    ./apps/devtools
    ./apps/fish
    ./apps/golang
    ./apps/neovim
    ./apps/rust
  ];

  home.packages = with pkgs; [
    neofetch
  ];
}
