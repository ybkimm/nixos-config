let
  aliases = {
    dokku = "ssh dokku@dokku.y";
  };
in
{
  programs.bash.shellAliases = aliases;
  programs.fish.shellAliases = aliases;
  programs.zsh.shellAliases = aliases;
}
