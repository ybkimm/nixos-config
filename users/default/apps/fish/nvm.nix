{ pkgs, ... }:
{
  programs.fish.plugins = [
    {
      name = "nvm";
      src = pkgs.fetchFromGitHub {
        owner = "jorgebucaran";
        repo = "nvm.fish";
        rev = "2.2.17";
        sha256 = "sha256-BNnoP9gLQuZQt/0SOOsZaYOexNN2K7PKWT/paS0BJJY=";
      };
    }
  ];
}
