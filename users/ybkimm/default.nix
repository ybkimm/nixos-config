{ pkgs, outputs, ... }:
let
  foo = builtins.trace outputs "bar";
in
{
  imports = [
    ../default

    ./apps/bun
    ./apps/capnproto
    ./apps/devtools
    ./apps/dokku
    ./apps/editorconfig
    ./apps/fasm
    ./apps/neovim
    ./apps/protobuf
    ./apps/scons
  ];

  home.packages = with pkgs; [
    curlHTTP3
  ];
}
