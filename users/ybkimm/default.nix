{ pkgs, outputs, ... }:
let
  foo = builtins.trace outputs "bar";
in
{
  imports = [
    ../default

    ./apps/dokku
    ./apps/editorconfig
    ./apps/protobuf
  ];

  home.packages = with pkgs; [
  ];
}
