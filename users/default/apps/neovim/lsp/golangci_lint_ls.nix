{ pkgs, ... }:
{
  home.packages = with pkgs; [
    golangci-lint
    golangci-lint-langserver
  ];

  programs.nixvim = {
    plugins.lsp = {
      servers.golangci_lint_ls = {
        enable = true;

        extraOptions = {
          root_dir.__raw = "require('lspconfig').util.root_pattern('go.mod')";
          filetypes = [
            "go"
            "gomod"
          ];
        };
      };
    };
  };
}
