{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim

    ./plugins/bufferline.nix
    ./plugins/comment.nix
    ./plugins/copilot.nix
    ./plugins/gitsigns.nix
    ./plugins/go-debug.nix
    ./plugins/indent-blankline.nix
    ./plugins/lsp.nix
    ./plugins/neo-tree.nix
    ./plugins/nvim-autopairs.nix
    ./plugins/scrolleof.nix
    ./plugins/sleuth.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/which-key.nix

    ./lsp/clangd.nix
    ./lsp/cssls.nix
    #./lsp/golangci_lint_ls.nix
    ./lsp/gopls.nix
    ./lsp/lua_ls.nix
    ./lsp/ts_ls.nix
  ];

  programs.nixvim = {
    enable = true;

    colorschemes = {
      tokyonight = {
        enable = true;
        settings.style = "night";
      };
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = false;
    };

    opts = {
      number = true;
      mouse = "a";
      fileformat = "unix";
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 250;
      timeoutlen = 250;
      completeopt = "menuone,noselect";
      termguicolors = true;
      scrolloff = 10;
      hlsearch = false;
    };

    clipboard = {
      register = "unnamedplus";
    };

    extraConfigLua = ''
      local function execute_selection()
        local start_pos = vim.fn.getpos("'<")
        local end_pos = vim.fn.getpos("'>")
        local lines = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)

        if #lines > 0 then
          lines[#lines] = lines[#lines]:sub(1, end_pos[3])
        end

        local selected_text = table.concat(lines, "\n")
        local output = vim.fn.system(selected_text)
        local output_lines = vim.split(output, "\n")

        vim.api.nvim_put(output_lines, "l", true, true)
      end

      vim.api.nvim_create_user_command('ExecuteSelection', execute_selection, { range = true })

      vim.keymap.set('v', '<leader>rr', ':ExecuteSelection<return>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>rr', '<S-v>:ExecuteSelection<return>', { noremap = true, silent = true })
    '';
  };

  programs.fish.shellAliases.vi = "nvim";
}
