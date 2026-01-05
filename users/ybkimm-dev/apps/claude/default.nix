{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    socat
    bubblewrap
  ];

  programs.fish.shellAliases = {
    claude = "~/.claude/local/claude";
  };
}
