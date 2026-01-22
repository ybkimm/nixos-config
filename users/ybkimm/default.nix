{ pkgs, ... }:
{
  imports = [
    ../default

    ./apps/bun
    ./apps/devtools
    ./apps/editorconfig
    ./apps/node
    ./apps/starship
    ./apps/tmux
  ];

  home.packages = with pkgs; [
    git-annex
    jq
  ];

  #home.sessionVariables = {
  #  SHELL = "${pkgs.fish}/bin/fish";
  #};
}
