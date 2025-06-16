{ pkgs, ... }:
let
  kakoune = let
    kakouneConfig = pkgs.writeTextFile (rec {
      name = "kakrc.kak";
      destination = "/share/kak/autoload/${name}";
      text = builtins.readFile ./kakrc.kak;
    });
  in
  pkgs.kakoune.override {
    plugins = with pkgs.kakounePlugins; [
      kakouneConfig
      auto-pairs-kak
    ];
  };
in
{
  home.packages = [
    kakoune
    pkgs.fzf
  ];
}
