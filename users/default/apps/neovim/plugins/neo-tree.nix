{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;

      settings = {
        filesystem = {
          filtered_items = {
            visible = true;
            hide_dotfiles = false;
            hide_gitignored = false;
          };
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
