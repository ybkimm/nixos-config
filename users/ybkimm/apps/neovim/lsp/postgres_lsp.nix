{ pkgs, ... }:
{
  home.packages = with pkgs; [
    postgres-lsp
  ];

  programs.nixvim = {
    plugins.lsp = {
      servers.postgres_lsp = {
        enable = true;

        extraOptions = {
          root_dir.__raw = "require('lspconfig').util.root_pattern('go.mod', 'sqlc.yaml')";
          single_file_support = true;
        };
      };
    };
  };
}
