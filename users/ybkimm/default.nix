{ pkgs, outputs, ... }:
let
  foo = builtins.trace outputs "bar";
in
{
  imports = [
    ../default

    ./apps/capnproto
    ./apps/clang
    ./apps/dokku
    ./apps/editorconfig
    ./apps/fasm
    ./apps/neovim
    ./apps/protobuf
  ];

  home.packages = with pkgs; [
    curlHTTP3
  ];
}
