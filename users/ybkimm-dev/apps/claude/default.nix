{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    bubblewrap
    libnotify
    ripgrep
    socat
  ];

  # Add ~/.local/bin to PATH?
}
