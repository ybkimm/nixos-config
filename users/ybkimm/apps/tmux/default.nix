{ config, pkgs, lib, ... }:
{
  programs.tmux = rec {
    enable = true;
    clock24 = true;
    baseIndex = 1;
    mouse = true;
    terminal = "tmux-256color";
    escapeTime = 50;
    prefix = "C-Space";
    shell = "${pkgs.fish}/bin/fish";
    sensibleOnTop = true;

    extraConfig =
      let
        defaultCommand = if pkgs.stdenv.isDarwin then
          "${pkgs.reattach-to-user-namespace}/bin/reattach-to-user-namespace -l ${shell}"
        else
          "${shell}";
      in
      ''
        set-option -g default-command "${defaultCommand}"
        set -sa terminal-overrides ",xterm*:Tc"
      '';
  };
}
