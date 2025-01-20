{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fasm
  ];
}
