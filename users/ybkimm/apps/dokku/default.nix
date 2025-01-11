let
  aliases = {
    dokku = "ssh dokku@dokku.y";
    dokkupub = "ssh dokku@pub.dokku.y";
  };
in
{
  programs.bash.shellAliases = aliases;
  programs.fish.shellAliases = aliases;
  programs.zsh.shellAliases = aliases;
}
