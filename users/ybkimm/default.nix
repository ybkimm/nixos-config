{ pkgs, outputs, ... }:
let
  foo = builtins.trace outputs "bar";
in
{
  imports = [
    ../default

    ./apps/capnproto
    ./apps/dokku
    ./apps/editorconfig
    ./apps/fasm
    ./apps/gcc
    ./apps/neovim
    ./apps/protobuf
    ./apps/scons
  ];

  home.packages = with pkgs; [
    curlHTTP3
  ];
}
