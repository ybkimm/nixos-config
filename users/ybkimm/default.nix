{ pkgs, ... }:
{
  imports = [
    ../default

    ./apps/bun
    ./apps/devtools
    ./apps/editorconfig
    ./apps/node
    ./apps/tmux
  ];

  home.packages = with pkgs; [
    curlHTTP3
  ];

  #home.sessionVariables = {
  #  SHELL = "${pkgs.fish}/bin/fish";
  #};
}
