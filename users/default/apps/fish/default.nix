{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      fish_add_path $HOME/.local/bin /opt/homebrew/bin
    '';
  };

  programs.bash = {
    enable = true;

    initExtra = ''
      if [[ ! $(${pkgs.procps}/bin/ps -ocomm= -p$PPID) =~ "fish" && -z ''${BASH_EXECUTION_STRING} ]]; then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
}
