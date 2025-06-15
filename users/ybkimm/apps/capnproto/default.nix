{ pkgs, ... }:
{
  home.packages = with pkgs; [
    capnproto
    go-capnp
  ];

  programs.fish = {
    interactiveShellInit = ''
      export CAPNP_IMPORT_PATH="${pkgs.go-capnp.src}/std"
    '';
  };
}
