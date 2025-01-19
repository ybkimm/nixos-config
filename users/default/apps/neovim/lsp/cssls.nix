{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vscode-langservers-extracted
  ];

  programs.nixvim = {
    plugins.lsp = {
      servers.cssls = {
        enable = true;
      };
    };
  };
}
