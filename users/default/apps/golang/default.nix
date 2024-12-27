{ pkgs, ... }:
{
  # Golang and go-related packages
  home.packages = with pkgs; [
    go
    gopls
    sqlc
    wire
  ];
}
