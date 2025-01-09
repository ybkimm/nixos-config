{ pkgs, ... }:
{
  home.packages = with pkgs; [
    capnproto
    go-capnp
  ];
}
