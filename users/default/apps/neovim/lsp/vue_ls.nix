{ pkgs, ... }:
let
  pkgs2 = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/870493f9a8cb0b074ae5b411b2f232015db19a65.tar.gz";
    sha256 = "sha256:045sqv2qym9hmly6c2khpbawwn26084x8lxz7qs0zqd5y9ahdjq4";
  }) { system = pkgs.system; };
in
{
  programs.nixvim = {
    plugins.lsp = {
      servers.vue_ls = {
        enable = true;

        package = pkgs2.vue-language-server;
      };
    };
  };
}
