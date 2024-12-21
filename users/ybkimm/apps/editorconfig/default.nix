let
  aliases = {
    editorconfig-go = "curl -o .editorconfig https://raw.githubusercontent.com/editorconfig/editorconfig-core-go/refs/heads/master/.editorconfig";
  };
in
{
  programs.bash.shellAliases = aliases;
  programs.fish.shellAliases = aliases;
  programs.zsh.shellAliases = aliases;
}
