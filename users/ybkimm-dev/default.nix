{ pkgs, ... }:
{
  imports = [
    ../ybkimm

    ./apps/claude
    ./apps/k8s
  ];

  home.sessionPath = [
    "$HOME/.local/bin"
  ];
}
