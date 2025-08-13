{ pkgs, ... }:
{
  imports = [
    ../default

    ./apps/actions
    ./apps/bun
    ./apps/claude
    ./apps/devtools
    ./apps/dokku
    ./apps/editorconfig
    ./apps/k8s
    ./apps/neovim
    ./apps/node
    ./apps/protobuf
    ./apps/scons
    ./apps/tmux
  ];

  home.packages = with pkgs; [
    curlHTTP3
  ];

  #home.sessionVariables = {
  #  SHELL = "${pkgs.fish}/bin/fish";
  #};
}
