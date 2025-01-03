{ pkgs, outputs, ... }:
let
  foo = builtins.trace outputs "bar";
in
{
  imports = [
    ../default

    ./apps/clang
    ./apps/dokku
    ./apps/editorconfig
    ./apps/neovim
    ./apps/protobuf
  ];

  home.packages = with pkgs; [
    curlHTTP3
  ];
}
