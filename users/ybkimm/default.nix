{ pkgs, outputs, ... }:
let
  foo = builtins.trace outputs "bar";
in
{
  imports = [
    ../default

    ./apps/capnproto
    ./apps/devtool
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
