{
  programs.nixvim = {
    plugins.lsp = {
      servers.gopls = {
        enable = true;

        extraOptions = {
          analyses = {
            unusedparams = true;
          };

          buildFlags = [ "-tags=wireinject" ];
          staticcheck = true;
        };
      };
    };
  };
}
