{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    ripgrep
  ];

  programs.fish.shellAliases = {
    claude = "~/.claude/local/claude";
  };
}
