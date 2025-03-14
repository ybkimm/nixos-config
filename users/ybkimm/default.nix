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
  ];

  home.packages = with pkgs; [
    curlHTTP3
  ];
}
