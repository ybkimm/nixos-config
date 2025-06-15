{ pkgs, outputs, ... }:
{
  imports = [
    ./apps/devtools
    ./apps/fish
    ./apps/golang
    ./apps/kakoune
    ./apps/neovim
    ./apps/rust
  ];

  home.packages = with pkgs; [
    neofetch
  ];
}
