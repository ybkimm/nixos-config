{
  programs.nixvim = {
    plugins.lsp = {
      servers.gdscript = {
        enable = true;
        package = null;
      };
    };
  };
}
