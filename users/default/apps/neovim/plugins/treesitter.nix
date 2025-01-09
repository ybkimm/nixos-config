{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        diff
        go
        html
        json
        lua
        luadoc
        make
        markdown
        markdown_inline
        nix
        regex
        sql
        toml
        vim
        vimdoc
        xml
        yaml
      ];

      settings = {
        highlight = {
          enable = true;

          additional_vim_regex_highlighting = true;
        };

        indent = {
          enable = true;
        };

        incremental_selection = {
          enable = true;

          keymaps = {
            init_selection = "<c-space>";
            node_incremental = "<c-space>";
            scope_incremental = "<c-s>";
            node_decremental = "<M-space>";
          };
        };
      };
    };

    plugins.treesitter-textobjects = {
      enable = true;

      select = {
        enable = true;
        lookahead = true;

        keymaps = {
          "aa" = "@parameter.outer";
          "ia" = "@parameter.inner";
          "af" = "@function.outer";
          "if" = "@function.inner";
          "ac" = "@class.outer";
          "ic" = "@class.inner";
        };
      };

      move = {
        enable = true;
        setJumps = true;
        gotoNextStart = {
          "]m" = "@function.outer";
          "]]" = "@class.outer";
        };
        gotoNextEnd = {
          "]M" = "@function.outer";
          "][" = "@class.outer";
        };
        gotoPreviousStart = {
          "[m" = "@function.outer";
          "[[" = "@class.outer";
        };
        gotoPreviousEnd = {
          "[M" = "@function.outer";
          "[]" = "@class.outer";
        };
      };

      swap = {
        enable = true;
        swapNext = {
          "<leader>a" = "@parameter.inner";
        };
        swapPrevious = {
          "<leader>A" = "@parameter.inner";
        };
      };
    };
  };
}
