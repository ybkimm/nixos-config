{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.lsp = {
      servers.clangd = {
        enable = true;

        package = null; # Use system's clangd
      };
    };
  };
}
