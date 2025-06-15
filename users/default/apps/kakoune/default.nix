{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kakoune
    kakoune-lsp
  ];
}
