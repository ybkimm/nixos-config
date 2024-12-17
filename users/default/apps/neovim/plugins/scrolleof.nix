{ pkgs, nixvim, ... }:
let
  scrollEOF = pkgs.vimUtils.buildVimPlugin {
    pname = "scrollEOF.nvim";
    version = "1.2.6";
    src = pkgs.fetchFromGitHub {
      owner = "Aasim-A";
      repo = "scrollEOF.nvim";
      rev = "75a471d8dab322947a28a7a810ab6ffc0dd051cf";
      sha256 = "sha256-88zxH2y/kByuqSkQJLuW/bs8QvA99kH2S71ie+9RLGo=";
    };
  };
in
{
  programs.nixvim = {
    extraPlugins = [
      scrollEOF
    ];

    extraConfigLua = ''
      require('scrollEOF').setup()
    '';
  };
}
