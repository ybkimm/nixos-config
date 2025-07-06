{ pkgs, ... }:
{
  imports = [
    ../default

    ./apps/bun
    ./apps/capnproto
    ./apps/claude
    ./apps/devtools
    ./apps/dokku
    ./apps/editorconfig
    ./apps/neovim
    ./apps/node
    ./apps/protobuf
    ./apps/scons
    ./apps/tmux
    ./apps/actions
  ];

  home.packages = with pkgs; [
    curlHTTP3
  ];

  #home.sessionVariables = {
  #  SHELL = "${pkgs.fish}/bin/fish";
  #};
}
