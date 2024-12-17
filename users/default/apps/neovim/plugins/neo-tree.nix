{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;

      filesystem = {
        filteredItems = {
          visible = true;
          hideDotfiles = false;
          hideGitignored = false;
        };
      };
    };

    # Dependencies
    plugins.web-devicons = {
      enable = true;
    };

    keymaps = [
      {
        key = "<leader>b";
        action = "<cmd>Neotree reveal float<return>";
        options = {
          silent = true;
        };
      }
    ];
  };
}
