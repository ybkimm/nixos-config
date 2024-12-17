{
  programs.nixvim = {
    plugins.indent-blankline = {
      enable = true;

      settings = {
        indent.char = "┊";
        whitespace.remove_blankline_trail = false;
      };
    };
  };
}
