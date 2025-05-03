{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    ripgrep
  ];

  programs.fish.functions = {
    claude = "npx -y @anthropic-ai/claude-code $argv";
  };
}
