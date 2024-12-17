{
  programs.ripgrep = {
    enable = true;
  };

  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      extensions = {
        fzf-native.enable = true;
      };

      keymaps = {
        "<leader><leader>" = {
          mode = "n";
          action = "git_files";
          options = {
            desc = "Search Git Files";
          };
        };

        "<leader><leader>g" = {
          mode = "n";
          action = "live_grep";
          options = {
            desc = "Search by [G]rep";
          };
        };
      };
    };
  };
}
