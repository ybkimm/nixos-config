{ ... }:
{
  programs.nixvim.plugins.copilot-lua = {
    enable = true;

    panel.keymap = {
      open = "<M-Bslash>";
    };

    suggestion.keymap = {
      accept = "<M-CR>";
      acceptWord = "<M-Right>";
      dismiss = "<M-BS>";
    };
  };
}
